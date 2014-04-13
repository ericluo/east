# encoding: utf-8

require 'open3'
require 'stringio'
require 'fileutils'

require 'thor'

module East
  class CLI < Thor
    include Thor::Actions

    desc "generate", "generate sql script"
    option :schemas, type: :string, required: true, default: :all
    option :username, type: :string, default: "db2inst1"
    option :password, type: :string, default: "db2inst1"
    def generate
      @username = options[:username]
      @password = options[:password]
      ["create_eastst.sql.erb"].each do |file|
        dest = File.basename(file).sub(/\.erb$/, '')
        template file, East.root.join("sql", dest)
      end
      
      schemas(options).each do |schema|
        @schema = schema

        ["create_table.sql.erb", "grant.sql.erb", "runstat.sql.erb"].each do |file|
          dest = File.basename(file).sub(/\.erb$/, '')
          template file, East.root.join("sql", @schema.downcase, dest)
        end
      end
    end

    desc "create DATABASE DIR", "create database on the given path"
    def create(dbname, dir)
      # add user for database
      run "sudo useradd -g db2iadm1 #{dbname}"
      # create database 
      run "db2 create database #{dbname} automatic storage yes on #{dir} using codeset gbk territory cn"
      # create database eastst
      run "db2 -tvf sql/create_#{dbname}.sql > log/create_#{dbname}.log"
    end

    desc "setup", "setup database and dbuser for given schemas"
    option :schemas, type: :string, default: :all
    def setup
      schemas(options).each do |schema|
        schema = schema.downcase

        # create table for schema
        run "db2 -tvf sql/#{schema}/create_table.sql > log/create_table_#{schema}.log"
        # grant rights to user
        run "db2 -tvf sql/#{schema}/grant.sql > log/grant_#{schema}.log"
        # create user for schema
        # run "sudo useradd #{schema}"
        # run "sudo passwd #{schema}"
      end
    end

    desc "check DIR", "check whether the name of files in the given DIR is valid"
    option :pattern, aliases: ['-p'], type: :string, default: '*.txt'
    def check(dir)
      path = Pathname(dir)

      puts "*" * 70
      puts "文件总数: #{sds.size}"
      puts "文件名格式错误数: #{malformat.size}"
      puts "*" * 25 + "--格式错误文件列表--" + "*" * 25
      malformat.each {|mf| puts "  #{mf.file}"}
    end

    desc "import DIR", "import data from the given directory"
    option :sync, :aliases => ["-s"], :type => :boolean, :default => false
    option :glob, :aliases => ['-g'], :type => :string,  :default => '*.txt'
    option :mode, :aliases => ["-m"], :type => :boolean, :default => true
    def import(dir)
      Table.load_files(dir, glob: options[:glob], sync: options[:sync], mode: options[:mode])
    end

    desc "backup DIR", "backup eastansy database to DIR"
    def backup(dir = "d:/backup/")
      backup_dir = Pathname.new(dir).join(Date.today.to_s)
      if backup_dir.directory?
        puts "#{backup_dir} exist, please remove the directory first or backup to another location"
        exit 1
      else
        FileUtils.cd(backup_dir) do
          run("db2look -d eastansy -l -e -o eastansy.ddl")
        end
        data_dir = backup_dir.join("db2move")
        FileUtils.cd(data_dir) do
          run("db2move eastansy export -sn eastansy")
        end
      end
    end

    desc "drop_tmp_tables LIMIT", "drop temporary tables before LIMIT days ago"
    def drop_tmp_tables(limit = 1)
      gen_date = (Time.now - limit.to_i.days).strftime('%Y-%m-%d')
      output = db2 "-x", <<-end
        connect to eastst user db2inst1 using db2inst1
        select tabschema, tabname from syscat.tables where tabname like 'CBRC%' and last_regen_time < to_date('#{gen_date}', 'yyyy-mm-dd')
      end

      lines = output.drop(28)[0..-2]
      create_file("sql/drop_tmp_tables.sql") do
        stmt = "connect to eastst user db2inst1 using db2inst1;\n"
        lines.inject(stmt) do |memo, line|
          schema, tabname = line.split(" ")
          memo <<  "drop table #{schema}.#{tabname};\n"
        end
        stmt
      end

      run "db2 -tvf sql/drop_tmp_tables.sql"

      # reduce tablespace EASTRUNDATA
      db2 "-x", <<-end
        connect to eastst user db2inst1 using db2inst1
        db2 alter tablespace EASTRUNDATA reduce
      end
      
    end

    # TODO truncate the database
    # truncate table schema.tabname immediate
    desc "clean", "empty given schemas"
    def clean
      schemas(options).each do |schema|
        run "db2 -tvf sql/truncate.sql"
      end
    end

    private
    # used by thor to find the template
    def self.source_root
      East.root.join("template")
    end

    def schemas(options)
      if options[:schemas] == :all
        East::BANKS.collect{|_,v| v["schema"]}
      else
        options[:schemas].split(',') || []
      end
    end

    def db2(opts, stream)
      Open3.popen3("db2 #{opts}") do |i, o, e, t|
        i.puts stream
        i.close

        o.readlines
      end
    end

    require 'etc'
    def as_user(user, &block)
      u = Etc.getpwnam(user)
      Process.fork do
        Process.uid = u.uid
        block.call
      end
    end

  end
end

# vim:shiftwidth=2:softtabstop=2:filetype=ruby:

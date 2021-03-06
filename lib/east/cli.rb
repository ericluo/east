# encoding: utf-8
require 'open3'
require 'stringio'
require 'pathname'
require 'fileutils'
require 'thor'

require 'east/table'

module East
  class CLI < Thor
    include Thor::Actions

    check_unknown_options!
    stop_on_unknown_option!
    add_runtime_options!
    # default_task :exec

    desc "generate", "生成数据库建表脚本"
    option :schemas,  type: :array,  default: :all
    option :username, type: :string, default: "db2inst1"
    option :password, type: :string, default: "wanyue0916"
    def generate
      @username = options[:username]
      @password = options[:password]
      ["create_eastst.sql.erb"].each do |file|
        dest = File.basename(file).sub(/\.erb$/, '')
        template file, East::ROOT_DIR.join("sql", dest)
      end
      
      schemas(options).each do |schema|
        @schema = schema

        ["create_table.sql.erb", "grant.sql.erb", "runstat.sql.erb"].each do |file|
          dest = File.basename(file).sub(/\.erb$/, '')
          template file, East::ROOT_DIR.join("sql", @schema.downcase, dest)
        end
      end
    end

    # before setup database, following next steps as db2inst1 user.
    # add user for database
    # sudo useradd -g db2iadm1 eastst
    # create database 
    # db2 create database eastst automatic storage yes on DIR using codeset gbk territory cn
    # create database eastst
    # db2 -tvf sql/create_eastst.sql > log/create_eastst.log
    desc "setup", "初始化数据库"
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

    desc "check DIR", "检查数据文件的文件名格式"
    def check(dir)
      require 'east/cli/check'
      Check.new(options, dir).run
    end

    desc "import DIR", "导入指定目录的数据文件"
    option :sync, :aliases => ["-s"], :type => :boolean, :default => false
    option :mode, :aliases => ["-m"], :type => :string,  :default => 'I', :enum => ['I', 'R']
    def import(dir)
      require 'east/cli/import'
      Import.new(options, dir).run
    end

    desc "backup", "备份模型数据库(EASTANSY)"
    option :directory, :type => :string, :default => "d:/backup"
    def backup
      require 'east/cli/backup'
      Backup.new(options, self).run
    end

    desc "drop_tmp_tables LIMIT", "删除过期临时数据表"
    def drop_tmp_tables(limit = 1)
      require 'east/cli/drop_tmp_tables'
      DropTmpTables.new(options, limit, self).run
    end

    # TODO truncate the database
    # truncate table schema.tabname immediate
    desc "clean", "清空数据表"
    def clean
      schemas(options).each do |schema|
        run "db2 -tvf sql/truncate.sql"
      end
    end

    no_commands {
      def db2_batch(script, stream = nil, &block)
        conn_stmt = "connect to eastst user db2inst1 using wanyue0916;"
        create_file(script, stream, block) 
        prepend_file(script, conn_stmt)
        `PATH=$PATH:~db2inst1/sqllib/bin db2 -xtvf #{script}`
      end
    }

    private
    # used by thor to find the template
    def self.source_root
      East::ROOT_DIR.join("template")
    end

    def schemas(options)
      schemas = options[:schemas]
      if schemas == :all
        Bank.instances.values.map(&:schema)
      else
        schemas
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

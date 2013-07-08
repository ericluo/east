# encoding: GBK

require 'thor'
require 'pathname'
require 'open3'
require 'logger'
require '../lib/east'

module East
  class Data < Thor
    FN_REGEXP = /^(?<license_num>\w+)-(?<interface_name>\w+)-(?<gather_data>\d+)$/ 
    MAPPER = YAML.load_file('../config/mapper.yaml')

    LICENSE_NUMBER = 'B0187H242010002'
    GATHER_DATE = '20130616'
    SCHEMA = 'HKYH'

    desc "load DIR", "load all data files"
    def load(dir)
      bank = East::Bank.new(SCHEMA, LICENSE_NUMBER)
      bank.load(dir, '20130616')
    end

    desc "check FILES", "check gathered data's filename with naming criteria"
    def check(*files)
      results = check_files(files)

      puts "*" * 70
      puts "正常文件数: #{results[:ok].size}"
      puts "格式错误文件数: #{results[:invalid].size}"
      puts "未映射文件数: #{results[:unmapped].size}" 
    end

    desc "import FILES", "import gathered data files to db"
    def import(*files)
      results = check_files(files)

      system("db2 connect to EASTST")
      system("db2 set current schema='HKYH'")

      results[:ok].each do |file|
	cmd = "db2 load from #{file} of del replace into #{SCHEMA}.#{map_table(file)}"
	logger.info "Load data with command: #{cmd}"
	Open3.popen2e(cmd) do |stdin, stdout_err, wait_thr|
	  stdin.close

	  while line = stdout_err.gets
	    $stdout.puts line
	    line = line.chomp
	    logger.info(line) if /行数/ =~ line
	  end

	  exit_status = wait_thr.value
	  if exit_status.success?
	    logger.info exit_status.inspect
	  else
	    logger.warn exit_status.inspect
	  end

	end
      end

    end

    desc "prepare", "prepare database connection"
    def prepare
      system("db2 connect to EASTST")
      system("db2 set current schema='HKYH'")
    end

    private
    def normalize_files(files)
      norm_files = []

      if files.empty?
	norm_files = Dir[File.join(Dir.pwd, "*.txt")]
      else
	files.each do |path|
	  if File.directory?(path)
	    norm_files += Dir[File.join(path, "*.txt")]
	  else
	    norm_files << path
	  end
	end
      end

      norm_files.map{|f| Pathname.new(f).realpath}
    end

    def check_files(files)
      files = normalize_files(files)
      results = Hash.new {|hash, key| hash[key] = []}
      files.each do |file|
	if FN_REGEXP =~ file.basename('.txt').to_s
	  (map_table(file) ? results[:ok] : results[:unmapped]) << file
	else
	  results[:invalid] << file
	end
      end

      results
    end

    # file: pathname
    def map_table(file)
      mdata = FN_REGEXP.match(file.basename('.txt').to_s)
      interface_name = mdata[:interface_name]
      MAPPER[interface_name]
    end

    def file_name(license_number, ifn, gather_date)
      "#{license_number}-#{ifn}-#{gather_date}"
    end

    def logger
      @logger ||= Logger.new('../log/east.log')
    end

  end
end

# vim:shiftwidth=2:softtabstop=2:filetype=ruby:

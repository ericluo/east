# encoding: utf-8

require 'open3'
require 'logger'

module East
  class Table
    @queue = :file_size_count

    def initialize(bank, record)
      @bank     = bank
      @category = record['接口类']
      @code     = record['表号']
      @cname    = record['表中文名']
      @ename    = record['表英文名']
      @fname    = record['接口文件名']
    end

    def logger
      @bank.logger
    end

    def self.perform(file)
      puts "File #{file} size: #{File.size(file)}"
    end

    # def self.perform(bank_name, table_code, file)
    #   bank = Bank.new(bank_name)
    #   table = bank.tables.select{|t| t.code == table_code }
    #   table.load_file(file)
    # end

    def load_file(file)
      # prepare
      
      logger.info "LOADING: #{file}"
      $stdout.puts "LOADING: #{command}"

      exit_status = run(command)
      if exit_status.success?
        logger.info "Loaded successfully"
      else
        logger.warn "Loaded with warning or error: #{exit_status.inspect}"
      end
    end

    def command
      "echo 'hello'"
      # "db2 load from #{file} of del replace into #{@bank.schema}.#{@tname}"
    end

    def run(cmd)
      Open3.popen2e(cmd) do |stdin, stdout_err, wait_thr|
	stdin.close

	while line = stdout_err.gets
	  $stdout.puts line
	  line = line.chomp
	  logger.info(line) if /行数/ =~ line
	end

	return wait_thr.value
      end
    end

    def prepare
      system("db2 connect to EASTST")
      system("db2 set current schema='#{@schema}'")
    end

  end
end

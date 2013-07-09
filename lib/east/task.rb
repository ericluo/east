# encoding: utf-8
require 'open3'
require 'logger'

module East
  class LoadDataTask
    @queue = :load_data

    def self.perform(bank_name, table_code, command)
      bank = Bank.new(bank_name)
      prepare(bank.schema)

      table = Table.find(bank, table_code)

      logger.info "LOADING Table: #{table.code} -- #{table.cname}"
      $stdout.puts "WITH SCRIPT: #{command}"

      exit_status = run(command)
      if exit_status.success?
        logger.info "Loaded Table #{table.code} successfully"
      else
        logger.warn "Loaded Table #{table.code} with warning or error: #{exit_status.inspect}"
      end
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

    def prepare(schema)
      system("db2 connect to EASTST")
      system("db2 set current schema='#{schema}'")
    end

  end
end

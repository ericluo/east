# encoding: utf-8

require 'yaml'
require 'pathname'
require 'logger'
require 'resque'
require 'csv'

module East
  class Bank
    $config = YAML.load_file('config/east.yaml')
    attr_reader :schema, :license, :logger

    def initialize(name)
      bank = $config[name]
      raise "Cloudn't find config parameter for bank #{name}" unless bank
      
      @schema = bank[:schema]
      @license = bank[:license]
      @name = name

      @tables ||= init_tables
      @logger ||= Logger.new("log/east_#{schema}.log")
    end

    def async_load_data(dir, gather_date)
      tables.each do |table|
        basename = "#{@license}-#{table.fname}-#{gather_date}.txt"
        data_file = Pathname.new(dir).join(basename)
        if File.exists(data_file)
          Resque.enqueue(Table, @name, table.code, data_file)
        else
          @logger.info "File #{data_file.to_s} not exist"
        end
      end
    end

    def async_count_file_size(dir)
      Dir.chdir(dir) do
        Dir['*.sql'].each do |f|
          f = Pathname.new(dir).join(f).to_s
          Resque.enqueue(Table, f)
        end
      end
    end

    def init_tables
      tables = []
      ::CSV.foreach('config/tables.csv', headers: true) do |row|
        tables << Table.new(self, row)
      end
      tables
    end
  end
end

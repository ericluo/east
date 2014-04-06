# encoding: utf-8

require 'resque'
require 'csv'
require 'pathname'
require 'yaml'

module East

  ROOT_DIR = Pathname(__FILE__).dirname.join('..', '..')
  BANK_CFG = YAML.load_file(ROOT_DIR.join('config', 'east.yaml'))
  TABLE_CFG = ROOT_DIR.join('config', 'tables.csv')

  class Bank
    attr_reader :schema, :license, :tables

    class << self
      def instances
        @instances ||=  {} 
      end
      
      def [](license)
        if cfg = BANK_CFG[license]
          instances[license] ||= Bank.new(license, cfg["schema"])
        else
          raise ArgumentError, "No bank exist for license: #{license}"
        end
      end
    end

    def initialize(license, schema)
      @license = license
      @schema  = schema

      @tables = CSV.read(TABLE_CFG, headers: true).map {|t| Table.new(*t.fields, schema)}
    end

    def async_load_data(dir, gather_date, append = false)
      tables.each do |table|
        fname = table.fname(dir, gather_date)
        if File.exists(fname)
          command = table.to_load_command(fname, append)
          Resque.enqueue(LoadDataTask, name, table.code, command)
        else
          $stdout.puts "File #{data_file.to_s} not exist"
        end
      end
    end

  end
end

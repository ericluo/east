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
        @instances ||=  BANK_CFG.inject({}) do |memo, cfg|
          license, schema = cfg.first, cfg.last["schema"]
          memo[license] = Bank.new(license, schema)
          memo
        end
      end
      
      def [](license)
        raise ArgumentError, "No bank exist for license: #{license}" unless instances[license]
        instances[license]
      end
    end

    def initialize(license, schema)
      @license = license
      @schema  = schema

      @tables = CSV.read(TABLE_CFG, headers: true).map {|t| Table.new(*t.fields, schema)}
    end

  end
end

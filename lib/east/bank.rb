# encoding: utf-8

require 'resque'
require 'csv'
require 'pathname'
require 'yaml'

module East

  class Bank
    attr_reader :name, :schema, :license, :tables

    def initialize(license)
      cfg_file = Pathname.new(__FILE__).dirname.join('../../config/east.yml')
      # cfg = YAML.load(cfg_file)
      cfg = YAML.load(File.expand_path('../../config/east.yml', __FILE__))
      puts cfg
      raise "No Bank found for license: #{license}" unless cfg[license]
      @license = license
      @schema = cfg[license][:schema]

      @tables = CSV.read(East.root.join('config/tables.csv'), headers: true).map do |row|
        Table.new(self, *row.fields)
      end
      
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

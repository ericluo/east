# encoding: utf-8

require 'resque'
require 'csv'

module East

  class Bank
    attr_reader :name, :schema, :license, :tables

    def initialize(name)
      bank = East.config[name]
      raise "Cloudn't find config parameter for bank #{name}" unless bank
      
      @schema = bank[:schema]
      @license = bank[:license]
      @name = name

      @tables = CSV.read(East.root.join('config/tables.csv'), headers: true).map do |row|
        Table.new(self, *row.fields)
      end
      
      # @tables = CSV.read(East.root.join('config/tables.csv'), headers: true).inject([]) do |ts, r|
      #   ts << Table.new(self, *r.fields)
      # end

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

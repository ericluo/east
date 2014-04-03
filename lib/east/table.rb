# encoding: utf-8
require 'pathname'
require 'csv'

module East
  class Table
    attr_accessor :category, :code, :cname, :ename, :iname, :mode
    attr_accessor :schema

    class << self

      def [](cond)
        ts ||= CSV.read(TABLE_CFG, headers: true).map {|r| Table.new(*r.fields, nil)}
        ts.find {|t| [t.ename, t.iname, t.code].include?(cond)}
      end
       
      # load all data files in dir with extname
      def load(dir, glob: '*.txt', sync: nil, mode: nil)
        path   = Pathname.new(dir)
        files  = path.file? ? [path] : path.join(glob).entries

        files.map do |file|
          basename = file.basename(file.extname)
          license, iname, _ = basename.to_s.scan /\w+/

          table = Bank[license].tables.find{|t| t.iname = iname}
          table.load(file, sync, mode)
        end
      end
    end

    def initialize(category, code, cname, ename, iname, mode, schema)
      @category = category
      @code     = code
      @cname    = cname
      @ename    = ename
      @iname    = iname
      @mode     = mode

      @schema   = schema
    end

    # TODO load data into database 
    def load(file, sync, mode)
      action = case mode
               when "I" then "insert"
               when "R" then "replace"
               else Table[iname].mode
               end
      "db2 load from #{file} of del #{action} into #{schema}.#{ename}"
    end
    
    def find(bank, code)
      bank.tables.select{|table| table.code == code}
    end

    def fname(dir, gather_date)
      basename = "#{bank.license}-#{iname}-#{gather_date}.txt"
      Pathname.new(dir).join(basename)
    end

    def to_load_command(fname, append)
      if append
      else
        "db2 load from #{fname} of del replace into #{schema}.#{ename}"
      end
    end

  end
end

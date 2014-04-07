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
       
      def find_by(file)
        file = Pathname(file)
        basename = file.basename(file.extname)
        license, iname, _ = basename.to_s.scan(/\w+/)

        Bank[license].tables.find {|t| t.iname == iname}
      end
        
      # load all data files in dir with extname
      def load(dir, glob: '*.txt', sync: nil, mode: nil)
        status = {success: [], fail: []}
        path   = Pathname.new(dir)
        files  = path.file? ? [path] : path.join(glob).entries

        files.each do |file|
          table = find_by(file)
          if table
            status[:success] << file
            table.load(file, sync: sync, mode: mode)
          else
            status[:fail] << file
          end
        end
        status
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
    def load(file, sync: false, mode: nil)
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

  end
end

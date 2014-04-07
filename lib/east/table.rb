# encoding: utf-8
require 'pathname'
require 'csv'

require 'resque'

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
      def batch_load(dir, pattern: '*.txt', sync: false, mode: nil)
        path   = Pathname.new(dir)
        files  = path.file? ? [path] : Pathname.glob(path.join(pattern)).entries

        status = {success: [], fail: []}
        files.each do |file|
          begin
            load(file, sync: sync, mode: mode)
            status[:success] << file
          rescue ArgumentError
            status[:fail] << file
          end
        end

        status
      end

      def load(file, sync: false, mode: nil)
        table = find_by(file)
        raise ArgumentError, "No table found for #{file}" unless table
        if sync
          table.load(file, mode: mode)
        else
          Resque.enqueue(Job::DataLoader, file, mode)
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
    def load(file, mode: nil)
      action = case mode
               when "I" then "insert"
               when "R" then "replace"
               else Table[iname].mode
               end
      cmd = "db2 load from #{file} of del #{action} into #{schema}.#{ename}"
      system(cmd)
    end
    
  end
end

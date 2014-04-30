# encoding: utf-8
require 'pathname'
require 'csv'
require 'resque'

require 'east/bank'
require 'east/job'

module East
    
  class Table
    attr_accessor :category, :code, :cname, :ename, :iname, :default_mode
    attr_accessor :schema

    include DBRunnable

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
      rescue ArgumentError
        nil
      end

      # check criteria
      #  license
      #  iname, interface file name 
      # return:
      #   fs, files with correct format
      #   mfs, files with malformat
      def check(dir)
        path  = Pathname.new(dir)
        files = path.file? ? [path] : Pathname.glob(path.join('*.txt')).entries
        mfs   = files.reject {|f| find_by(f)}
        fs    = files - mfs

        [fs, mfs]
      end
        
      def load_files(dir, sync: false, mode: nil)
        fs, mfs = check(dir)
        fs.each {|file| find_by(file).load_file(file, sync: sync, mode: mode)}
        {success: fs, fail: mfs}
      end
    end

    def initialize(category, code, cname, ename, iname, default_mode, schema)
      @category     = category
      @code         = code
      @cname        = cname
      @ename        = ename
      @iname        = iname
      @default_mode = default_mode

      @schema       = schema
    end

    # TODO load data into database 
    def load_file(file, sync: false, mode: nil)
      if sync
        load(file, mode)
      else
        Resque.enqueue(Job::DataLoader, file, mode)
      end
    end
    
    def load(file, mode)
      mode ||= Table[iname].default_mode
      action = ("R" == mode) ? "replace" : "insert"
      db_cmd "db2 load from #{file} of del #{action} into #{schema}.#{ename}"
    end
    
  end
end

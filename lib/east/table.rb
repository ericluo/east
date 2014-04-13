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
      rescue ArgumentError
        nil
      end

      # check criteria
      #  license
      #  iname, interface file name 
      def check(dir, glob: '*.txt')
        path         = Pathname.new(dir)
        files        = path.file? ? [path] : Pathname.glob(path.join(glob)).entries
        mfs = files.reject {|f| find_by(f)}
        fs  = files - mfs


        if block_given?
          yield fs, mfs
        else
          [fs, mfs]
        end
      end
        
      def load_files(dir, glob: '*.txt', sync: false, mode: nil)
        fs, mfs = check(dir, glob: glob)
        fs.each {|file| find_by(file).load_file(file, sync, mode)}
        {success: fs, fail: mfs}
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
    def load_file(file, sync, mode)
      mode ||= Table[iname].mode
      action = ("R" == mode) ? "replace" : "insert"
      if sync
        cmd = "db2 load from #{file} of del #{action} into #{schema}.#{ename}"
        system(cmd)
      else
        Resque.enqueue(Job::DataLoader, file, mode)
      end
    end
    
  end
end

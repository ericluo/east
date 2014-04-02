# encoding: utf-8
require 'pathname'
require 'csv'

module East
  class Table
    attr_accessor :category, :code, :cname, :ename, :iname, :mode
    attr_accessor :schema

    class << self

      def [](index)
        cfg = Pathname.new(__FILE__).dirname.join('../../config/tables.csv')
        tables = CSV.read(cfg, headers: true).map do |row|
          Table.new(*row.fields)
        end
        tables.find {|t| [t.code, t.ename, t.iname].include?(index)}
      end

      def load(dir, glob: '*.txt', sync: false, mode: 'R')
        path = Pathname.new(dir)
        tables = if path.directory?
                   Dir[File.join(dir, glob)].map{|f| Table.new(f, mode)}
                 elsif path.exist?
                   [Table.new(path, mode)]
                 else
                   raise ArgumentError, "#{dir} not exists"
                 end

        # tables.each do |sd|
        #   if options[:sync]
        #     sd.load
        #   else
        #     sd.async_load
        #   end
        # end
      end

      def instance(file)
        basename = file.basename(file.extname)
        license, iname, _ = basename.scan /\w+/
        table = Table[iname]
      end
    end

    def initialize(category, code, cname, ename, iname, mode)
      @category = category
      @code     = code
      @cname    = cname
      @ename    = ename
      @iname    = iname
      @mode     = mode
    end

    def find(bank, code)
      bank.tables.select{|table| table.code == code}
    end

    def fname(dir, gather_date)
      basename = "#{bank.license}-#{iname}-#{gather_date}.txt"
      Pathname.new(dir).join(basename)
    end

    def schema
      bank.schema
    end

    def to_load_command(fname, append)
      if append
        "db2 load from #{fname} of del insert into #{schema}.#{ename}"
      else
        "db2 load from #{fname} of del replace into #{schema}.#{ename}"
      end
    end

  end
end

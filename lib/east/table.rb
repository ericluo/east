# encoding: utf-8
require 'pathname'

module East
  class Table
    attr_accessor :category, :code, :cname, :ename, :iname
    attr_reader   :bank

    def initialize(bank, category, code, cname, ename, iname)
      @bank     = bank
      @category = category
      @code     = code
      @cname    = cname
      @ename    = ename
      @iname    = iname
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

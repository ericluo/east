# encoding: utf-8

module East
  class Table
    attr_accessor :category, :code, :cname, :ename, :iname
    attr_reader   :bank

    def initialize(bank, record)
      @bank     = bank
      @category = record['接口类']
      @code     = record['表号']
      @cname    = record['表中文名']
      @ename    = record['表英文名']
      @iname    = record['接口文件名']
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

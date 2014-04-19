require 'east'
module East
  class CLI::DropTmpTables
    include East::DBProxy
    attr_reader :options, :limit, :thor

    def initialize(options, limit, thor)
      @options = options
      @limit   = limit
      @thor    = thor
    end

    def run
      gen_date = (Time.now - limit.to_i.days).strftime('%Y-%m-%d')
      output = db2 "-x", <<-end
        connect to eastst user db2inst1 using db2inst1
        select tabschema, tabname from syscat.tables where tabname like 'CBRC%' and last_regen_time < to_date('#{gen_date}', 'yyyy-mm-dd')
      end

      lines = output.drop(28)[0..-2]
      thor.create_file("sql/drop_tmp_tables.sql") do
        stmt = "connect to eastst user db2inst1 using db2inst1;\n"
        lines.inject(stmt) do |memo, line|
          schema, tabname = line.split(" ")
          memo <<  "drop table #{schema}.#{tabname};\n"
        end
        stmt
      end

      thor.run "db2 -tvf sql/drop_tmp_tables.sql"

      # reduce tablespace EASTRUNDATA
      db2 "-x", <<-end
        connect to eastst user db2inst1 using db2inst1
        db2 alter tablespace EASTRUNDATA reduce
      end
    end
  end
end

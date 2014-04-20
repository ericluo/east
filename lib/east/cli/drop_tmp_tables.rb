require 'east'
module East
  class CLI::DropTmpTables
    attr_reader :options, :limit, :thor

    def initialize(options, limit, thor)
      @options = options
      @limit   = limit
      @thor    = thor
    end

    def run
      gen_date = (Time.now - limit.to_i.days).strftime('%Y-%m-%d')

      select_script, drop_script = "sql/select_tmp_tables.sql", "sql/drop_tmp_tables.sql"
      tmp_tables = thor.db2_batch(select_script) do
        %Q{select tabschema, tabname from syscat.tables where tabname like 'CBRC%' and last_regen_time < to_date('#{gen_date}', 'yyyy-mm-dd');}
      end

      puts "tables " + tmp_tables
      
      thor.db2_batch(drop_script) do
        tmp_tables.map do |line|
          schema, tabname = line.split(" ")
          "drop table #{schema}.#{tabname};"
        end.join("\n")
      end
    end
  end
end

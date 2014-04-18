require 'open3'

module East
  module DBProxy
    DB2 = "/home/db2inst1/sqllib/bin/db2"
    
    def psql(opts, input)
      IO.popen("psql #{opts}", 'r+') do |io|
        io.puts input
        io.close_write
        return io.read
      end
    end

    def db2(opts, input)
      Open3.popen2e("db2 #{opts}")
    end
  end
end

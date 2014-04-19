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

    def db2(opts, stream = '')
      Open3.popen3("#{DB2} #{opts}") do |i, o, e, t|
        block_given? ? yield(i) : i.puts(stream)
        i.close

        o.readlines
      end
    end

  end
end

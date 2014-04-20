require 'open3'

require 'thor'

module East
  module DBProxy
    def psql(opts, input)
      IO.popen("psql #{opts}", 'r+') do |io|
        io.puts input
        io.close_write
        return io.read
      end
    end

    # stream: sql script to execute, 'connect to dbname' will be added automatically.
    # block:  string returned from block will be added to stream
    def db2(opts, stream = nil, &block)
      Open3.popen3("#{DB2_CMD} #{opts}") do |i, o, e, t|
        stream ||= block_given? ? block.call : ''
        stream.each_line.to_a.unshift(conn_stmt).map{|stmt| i.puts stmt}
        i.close

        o.readlines
      end
    end

  end
end

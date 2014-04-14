module East
  module DBProxy
    def psql(opts, input)
      IO.popen("psql #{opts}", 'r+') do |io|
        io.puts input
        io.close_write
        return io.read
      end
    end
  end
end

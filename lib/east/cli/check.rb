# -*- coding: utf-8 -*-

module East
  class CLI::Check
    attr_reader :options, :dir

    def initialize(options, dir)
      @options = options
      @dir     = dir
    end

    def run
      fs, mfs = Table.check(@dir, glob: options[:glob])

      puts "文件名格式错误的: #{mfs.size}"
      mfs.each {|mf| puts "  #{mf}"}
      puts "文件名格式正确的: #{fs.size}"
      fs.each {|f| puts "  #{f}"}
    end
  end
end

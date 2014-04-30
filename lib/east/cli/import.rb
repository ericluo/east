module East
  class CLI::Import
    attr_reader :options, :dir

    def initialize(options, dir)
      @options = options
      @dir = dir
    end

    def run
      Table.load_files(dir, glob: options[:glob], sync: options[:sync], mode: options[:mode])
    end
  end
end

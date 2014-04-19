require 'pathname'

module Minitest
  module Path
    def root
      @root ||= Pathname.new(File.expand_path("../../..", __FILE__))
    end

    def tmp(*path)
      root.join("tmp", *path)
    end

    def backup_path(*path)
      tmp.join("backup", *path)
    end

    extend self
  end
end

# encoding: utf-8

require 'logger'
require 'yaml'
require 'pathname'

module East
  attr_accessor :logger, :root, :config
  extend self
end

East.root = Pathname.new(File.expand_path('../..', __FILE__))
East.config = YAML.load_file(East.root.join('config/east.yaml'))
East.logger = Logger.new(East.root.join('log/east.log'))

require 'east/bank'
require 'east/table'
require 'east/version'

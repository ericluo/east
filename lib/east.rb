# encoding: utf-8

require 'bundler/setup'

require 'pry'
require 'active_support'
require 'active_support/core_ext/hash'

require 'pathname'
require 'open3'
require 'logger'
require 'yaml'


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
require 'east/cli'
require 'east/standard_data'
require 'east/db_action'
# require 'east/data_loader'

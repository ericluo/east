# encoding: utf-8

require 'east/bank'
require 'east/table'

module East
  attr_accessor :logger, :root
  extend self
end

East.root = Pathname.new(File.expand_path('..', __FILE__))
East.logger = Logger.new(East.root.join('log/east.log'))

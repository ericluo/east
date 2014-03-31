# encoding: GBK

require 'resque'
require_relative 'job'

module East
  class StandardData
    # extend Forwardable
    IFN_REGEXP = /^(?<license>\w+)-(?<interface>\w+)-(?<gdate>\d+)$/ 
    attr_reader :file, :license, :interface, :gdate

    @queue = :data_loader

    def initialize(file, incremental)
      @file = file
      @incremental = incremental
      @license, @interface, @gdate = basename.scan /\w+/
    end

    def basename ; File.basename(@file, File.extname(@file)); end
    
    def bank ; Bank.find(@license); end
    
    def valid? ; pattern_valid? && license_valid? && interface_valid? ; end

    def pattern_valid? ; IFN_REGEXP =~ basename; end

    def license_valid? ; !bank.nil?; end

    def interface_valid? ; MAPPER.has_key?(@interface); end
    
    def mdate ; File.new(@file).mtime.to_date; end

    def logger; bank.logger; end

    def cmds
      action = @incremental ? "insert" : "replace"
      "db2 load from #{@file} of del #{action} into #{bank.schema}.#{MAPPER[@interface]}"
    end

    def async_load
      Resque.enqueue(Job::DataLoader, @file, @incremental)
    end

    def load
      system "db2 connect to eastst user db2inst1 using db2inst1"
      system cmds
      # IO.popen("db2", 'w') do |io|
      #   io.puts "connect to eastst user db2inst1 using db2inst1"
      #   io.puts cmds
      # end
    end

  end
end

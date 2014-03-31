require 'resque'
require 'resque-history'
require_relative 'standard_data'

module East
  module Job
    class DataLoader
      @queue = :data_loader
      extend Resque::Plugins::History

      def self.perform(file, incremental)
        sd = ::East::StandardData.new(file, incremental)
        sd.load
      end
    end
  end
end

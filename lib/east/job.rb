require 'resque'
require 'resque-history'
require 'east/table'

module East
  module Job
    class DataLoader
      @queue = :data_loader
      extend Resque::Plugins::History

      def self.perform(file, mode)
        table = Table.find_by(file)
        table.load(file, mode)
      end
    end
  end
end

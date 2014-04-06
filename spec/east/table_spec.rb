require_relative '../spec_helper'

module East
  describe Table do
    describe '.load' do
      it "generate sql script for every data file" do
        file = File.expand_path('../../fixtures/B0187H242010002-JGXXB-20140228.txt', __FILE__)
        Table.load(file)
        # table.code.must_equal '101'
      end
    end
  end

end

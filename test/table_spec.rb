require_relative 'spec_helper'

describe East::Table do
  it "initialized with default mode" do
    table = East::Table['101']
    table.mode.must_equal "R"
  end

  describe '.instance' do
    it "return an table instance according to file" do
      table = East::Table.instance('B0187H242010002-JGXXB-20140228.txt')
      table.code.must_equal '101'
    end
  end
end

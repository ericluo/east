require_relative 'spec_helper'
 
describe East::Bank do
  describe 'populated banks with config file' do
    it 'create banks according to east.yaml' do
      banks = East::Bank.instances
      banks.each {|b| b.schema.wont_be_nil}
      banks.size.must_equal 4
    end
  end
  
  describe 'when initialized with the given name' do
    it 'returned with associated tables' do
      bank = East::Bank['B0187H242010002']
      bank.tables.size.must_equal 57
    end

    it 'pending' do
      skip
    end
    
  end
end

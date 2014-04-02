require_relative 'spec_helper'

describe 'Bank' do
  describe 'when initialized with the given name' do
    it 'returned with associated tables' do
      bank = East::Bank.new('B0187H242010002')
      bank.tables.size.must_equal 57
    end

    it 'pending' do
      skip
    end
    
  end
end

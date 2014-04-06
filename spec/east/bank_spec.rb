require 'spec_helper'

module East
  describe Bank do
    describe '.[]' do
      it 'will get the same bank instance with the same license' do
        bank1 = Bank['B0187H242010002']
        bank2 = Bank['B0187H242010002']
        bank1.must_be_same_as bank2
      end

      it 'will get bank instance with tables populated' do
        bank1 = Bank['B0187H242010002']
        bank1.tables.size.must_equal 57
      end
      
      it "will raise error when license is wrong" do
        proc { Bank['B00'] }.must_raise ArgumentError
      end
    end
  end
end

require 'spec_helper'

module East
  describe Table do
    before do
      @file = File.expand_path('../../fixtures/B0187H242010002-JGXXB-20140228.txt', __FILE__)
    end
    
    describe '.load' do
      it "load files successfully when file pattern matched" do
        result = Table.load(@file)
        result[:success].size.must_equal 1
        result[:fail].size.must_equal 0
      end
    end

    it "generate sql script for the given file" do
      table = Table.find_by(@file)
      table.load(@file, sync: true, mode: "I").must_equal <<-SQL.chomp.strip
        db2 load from #{@file} of del insert into HKYH.T_GX_JGXX
      SQL
    end
  end

end

require 'spec_helper'

module East
  describe Table do
    before do
      @dir = Pathname.new('../../fixtures/').expand_path(__FILE__)
      @file = @dir.join('B0187H242010002-JGXXB-20140228.txt')
      @dismatched_file = @dir.join('malformatted.txt')
    end
    
    describe '.load_files' do
      it "batch load files and return the status" do
        result = Table.load_files(@dir)
        result[:success].size.must_equal 1
        result[:fail].size.must_equal 1
      end

      it "queue the load job when file pattern matched" do
        before = Resque.size(:data_loader)
        Table.load_files(@file, mode: 'I')
        after = Resque.size(:data_loader)
        assert_equal 1, after - before
        # proc { Table.load_file(@file, mode: 'I') }.must_change(Resque, :size, :data_loader, 1)
      end
    end

    it "generate sql script for the given file" do
      table = Table.find_by(@file)
      table.load_file(@file, false, nil)
      # table.load(@file, mode: "I").must_equal <<-SQL.chomp.strip
      #   db2 load from #{@file} of del insert into HKYH.T_GX_JGXX
      # SQL
    end
  end

end

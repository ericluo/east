require 'spec_helper'
require 'east/cli/drop_tmp_tables'

module East
  describe CLI::DropTmpTables do
    include Minitest::Helpers
    it "will generate drop script" do
      # use force switch to make thor overwrie file already exist
      east "drop_tmp_tables", force: true, exitstatus: true
      exitstatus.must_equal 0
    end
  end
end

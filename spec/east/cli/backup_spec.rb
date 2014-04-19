require 'spec_helper'
require 'east/cli/backup'

module East
  describe "east backup" do
    include Minitest::Helpers
    include Minitest::Path

    it "raise exception when backup root dir not exist" do
      FileUtils.rm_rf(backup_path)
      east "backup", directory: backup_path, exitstatus: true
      out.must_include "not exist"
      exitstatus.must_equal 1
    end

    it "will successed when backup root dir existed" do
      begin
        FileUtils.mkdir_p(backup_path)
        east "backup", directory: backup_path, exitstatus: true
        out.must_include "run"
        exitstatus.must_equal 0
      ensure
        FileUtils.rm_rf(backup_path)
      end
    end
  end
end

require 'spec_helper'

module East
  describe DBProxy do
    include DBProxy
    it "psql command will connect to pg database and execute sql command" do
      if mac?                   # os guard because psql installed only on macosx 
        psql("testdb ", "select 1 + 1;select current_date;").must_match "2"
        puts psql "testdb", <<-end
        select 1 + 1;
        select current_date;
      end
      end
    end
  end
end

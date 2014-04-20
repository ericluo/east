require 'spec_helper'

module East
  describe DBProxy do
    include DBProxy
    if mac?
      it "psql command will connect to pg database and execute sql command" do
        psql("testdb ", "select 1 + 1;select current_date;").must_match "2"
      end
    end
  end
end

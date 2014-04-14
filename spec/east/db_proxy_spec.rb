require 'spec_helper'

module East
  describe DBProxy do
    it ".pg will connect to pg database and execute sql command" do
      unless linux?
        DBProxy.psql("testdb ", "select 1 + 1;select current_date;").must_match "2"
        puts DBProxy.psql "testdb", <<-end
          select 1 + 1;
          select current_date;
        end
      end
    end
  end
end

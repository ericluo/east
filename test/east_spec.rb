require_relative 'spec_helper'

describe East do
  it "set the root path correctly" do
    East.root.must_equal Pathname.new(File.expand_path("../..", __FILE__))
  end
end

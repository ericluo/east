require_relative 'spec_helper'

describe East::Table do
  it "initialized with default mode" do
    table = East::Table['101']
    table.mode.must_equal "R"
  end
end

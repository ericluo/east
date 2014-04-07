require 'minitest/autorun'
require 'minitest/pride'
require 'east'

module Minitest::Assertions
  def assert_changes(obj, method, *args, exp_diff)
    before = obj.send(method, *args)
    yield
    after = obj.send(method, *args)
    diff = after - before

    assert_equal exp_diff, diff, "Expected #{obj.class.name}##{method} to change by #{exp_diff}, changed by #{diff}"
  end
end

module Minitest::Expectations
  infect_an_assertion :assert_changes, :must_change
end


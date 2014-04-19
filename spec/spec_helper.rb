require 'minitest/autorun'
require 'minitest/pride'
require 'east'

Dir["#{File.expand_path('../support', __FILE__)}/*.rb"].each do |file|
  require file unless file =~ /fakeweb\/.*\.rb/
end

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

module Minitest::Guard
  def linux? platform = RUBY_PLATFORM
    /linux/ =~ platform
  end

  def mac? platform = RUBY_PLATFORM
    /darwin/ =~ platform
  end
end

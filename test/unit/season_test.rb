require 'test_helper'
require 'date'

class SeasonTest < ActiveSupport::TestCase
  test "a new season" do
    a = Season.new 1999
    assert_equal 1999, a.year
    assert_equal 1999, a.start.year
    assert_equal 2000, a.stop.year
  end

  test "current season" do
    a = Season.current_season
    assert_equal a.start.year + 1, a.stop.year
  end
end

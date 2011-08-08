require 'spec_helper'
require 'date'

describe Season do
  it "should have a current season" do
    year = 2010
    Date.any_instance.stubs(:today).returns(Date.new(year, 06, 06)).at_least_once
    current = Season.current_season
    current.start.year.should == year
    current.stop.year.should == year + 1
  end

  it "should have a stop year one more than the stop year" do
    year = 1999
    season = Season.new year
    season.year.should == year
    season.start.year.should == year
    season.stop.year.should == year + 1
  end
end

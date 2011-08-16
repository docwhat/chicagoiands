require 'spec_helper'
require 'date'

describe Season do
  it "should have a current season (pre-cutoff)" do
    year = 2000
    Date.expects(:today).returns(Date.new(year, 6, 6)).at_least_once
    current = Season.current_season
    current.start.year.should == year - 1
    current.stop.year.should == year
  end

  it "should have a current season (post-cutoff)" do
    year = 2001
    Date.expects(:today).returns(Date.new(year, 9, 6)).at_least_once
    current = Season.current_season
    current.start.year.should == year
    current.stop.year.should == year + 1
  end

  it "should have a stop year one more than the stop year" do
    year = 2002
    season = Season.new year
    season.year.should == year
    season.start.year.should == year
    season.stop.year.should == year + 1
  end

  it "should start on the 15th of August" do
    year = 2003
    season = Season.new year
    season.start.should == Date.new(year, 8, 15)
    season.stop.should == Date.new(year + 1, 8, 15)
  end
end

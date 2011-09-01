require 'spec_helper'
require 'nokogiri'

describe "meetings header partial" do
  before :each do
    view.stubs(:current_user).returns(nil).at_least_once
  end

  def partialize options={}
    Nokogiri::HTML(render :partial => "meetings/header", :locals => options)
  end

  it "renders correctly" do
    meeting = Factory.create(:meeting)
    html = partialize :meeting => meeting
    html.css('header').length.should == 1
  end

  it "should have the proper id" do
    meeting = Factory.create(:meeting)
    html = partialize :meeting => meeting
    html.css("#meeting-#{meeting.date}").length.should == 1
  end

  context "a meeting with a dvd" do
    it "should have the buy-this-dvd element" do
      meeting = Factory.create(:meeting, :has_dvd => true)
      html = partialize :meeting => meeting
      html.css('.has-dvd').length.should == 1
    end
  end
end

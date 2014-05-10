require 'spec_helper'
require 'nokogiri'

describe 'meetings header partial' do
  before :each do
    view.stub(:current_user).and_return(nil)
  end

  def partialize(options = {})
    Nokogiri::HTML(render partial: 'meetings/header', locals: options)
  end

  it 'renders correctly' do
    meeting = FactoryGirl.create(:meeting)
    html = partialize meeting: meeting
    html.css('header').length.should == 1
  end

  it 'should have the proper id' do
    meeting = FactoryGirl.create(:meeting)
    html = partialize meeting: meeting
    html.css("#meeting-#{meeting.date}").length.should == 1
  end

  context 'a meeting without a dvd' do
    it 'should not have the buy-this-dvd element' do
      meeting = FactoryGirl.create(:meeting, has_dvd: false)
      html = partialize meeting: meeting
      html.css('.has-dvd').length.should == 0
    end
  end

  context 'a meeting with a dvd' do
    it 'should have the buy-this-dvd element' do
      meeting = FactoryGirl.create(:meeting, has_dvd: true)
      html = partialize meeting: meeting
      html.css('.has-dvd').length.should == 1
    end
  end
end

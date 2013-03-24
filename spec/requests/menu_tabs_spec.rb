require 'spec_helper'

describe "The layout has menu tabs" do
  it "has tabs on the homepage" do
    FactoryGirl.create(:texture, :label => 'welcome')
    visit root_path
    page.should have_selector("nav li#home.selected")
  end

  it "has meetings selected on a meetings page" do
    meeting = FactoryGirl.create(:meeting)
    visit meeting_path(meeting)
    #save_and_open_page
    page.should have_selector("nav li#meetings.selected")
  end

  it "has meetings selected on a stories page" do
    story = FactoryGirl.create(:story)
    visit story_path(story)
    #save_and_open_page
    page.should have_selector("nav li#stories.selected")
  end
end

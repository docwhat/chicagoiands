require 'spec_helper'
require 'date'

describe "Welcome Page" do
  describe "Verify next meeting" do
    it "shows the next meeting" do
      future = Date.today + 20
      meeting = FactoryGirl.create(:meeting, :date => future)
      visit root_path
      page.should have_selector("article.next-meeting")
      page.should have_no_selector("article.no-meeting")
    end

    it "shows no meeting if there is none" do
      Meeting.all.each { |x| x.destroy }
      visit root_path
      page.should have_selector("article.no-meetings")
    end
  end
end

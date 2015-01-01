# coding: utf-8

require 'spec_helper'
require 'date'

describe 'Welcome Page' do
  before { FactoryGirl.create(:texture, label: 'welcome') }

  describe 'Verify next meeting' do
    it 'shows the next meeting' do
      future = Date.today + 20
      FactoryGirl.create(:meeting, date: future)
      visit root_path
      page.should have_selector('article.next-meeting')
      page.should have_no_selector('article.no-meeting')
    end

    it 'shows no meeting if there is none' do
      Meeting.all.each(&:destroy)
      visit root_path
      page.should have_selector('article.no-meetings')
    end
  end
end

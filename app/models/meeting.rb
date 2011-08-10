require 'season'
require 'rendered_model'

class Meeting < ActiveRecord::Base
  include RenderedModel

  validates :date,  :presence => true, :uniqueness => true
  validates :title, :presence => true, :length => {:minimum => 2}

  ##
  # The next meeting
  def self.next
    return Meeting.where("meetings.date >= ?", Date.today).order("meetings.date asc").first
  end

  ##
  # Is this the next meeting?
  def next?
    self == Meeting.next
  end

  ##
  # Returns all meetings in a specific season.
  #
  # All seasons start on August 15th of each year.
  def self.in_season season
    Meeting.
      where("meetings.date >= ? AND meetings.date < ?", season.start, season.stop)
      .order("meetings.date ASC")
      .all
  end

end

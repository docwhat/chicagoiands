require 'season'
class Meeting < ActiveRecord::Base
  before_save :update_rendered

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
      .order("meetings.date desc")
      .all
  end

  ##
  # Updates the rendered field for the meeting.
  def update_rendered
    self.rendered = Kramdown::Document.new(self.body).to_html
  end

end

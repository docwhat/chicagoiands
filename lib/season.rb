require 'date'
##
# A season
# Seasons begin on August 15th of each year.
class Season
  FIRST_SEASON = 1999
  LAST_SEASON = 2100
  attr_reader :year

  ##
  # Takes the year the season started.
  def initialize year
    year = year.to_i
    year = current_season.year if year < FIRST_SEASON || year > LAST_SEASON
    @year = year
  end

  ##
  # The start of a season as a Date.
  def self.start_of_season year
    return Date.new year, 8, 15
  end

  ##
  # The current season
  def self.current_season
    today = Date.today
    season_cutoff = Season.start_of_season today.year
    if today >= season_cutoff
      Season.new(today.year)
    else
      Season.new(today.year - 1)
    end
  end

  ##
  # object method version
  def current_season
    Season.current_season
  end

  ##
  # Returns all known seasons.
  def self.seasons
    (FIRST_SEASON..(Date.today.year+1)).map {|x| Season.new x}
  end

  def to_s
    "#{@year}-#{@year+1}"
  end

  ##
  # The date the season starts, inclusive.
  def start
    Season.start_of_season @year
  end

  ##
  # The date the season ends, exclusive.
  def stop
    Season.start_of_season @year + 1
  end

end

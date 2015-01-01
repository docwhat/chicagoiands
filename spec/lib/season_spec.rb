require 'spec_helper'
require 'season'

describe Season do
  context 'given a date just prior to a season cut-off' do
    before { Timecop.freeze(Date.new(year, 6, 6)) }
    let(:year) { 2000 }
    let(:season) { Season.current_season }

    it 'should start last year' do
      expect(season.start.year).to eq(year - 1)
    end

    it 'should stop this year' do
      expect(season.stop.year).to eq(year)
    end
  end

  context 'given a date just after the season cut-off' do
    before { Timecop.freeze(Date.new(year, 9, 6)) }
    let(:year) { 2001 }
    let(:season) { Season.current_season }

    it 'should start this year' do
      expect(season.start.year).to eq(year)
    end

    it 'should end next year' do
      expect(season.stop.year).to eq(year + 1)
    end
  end

  context 'given a random year' do
    let(:season) { Season.new year }
    let(:year) { 1990 + rand(20) }

    it 'should have a stop year one more than the start year' do
      expect(season.stop.year).to eq(season.start.year + 1)
    end

    it 'should start in August' do
      expect(season.start.month).to eq(8)
    end

    it 'should start on the 15th' do
      expect(season.start.day).to eq(15)
    end

    it 'should stop in August' do
      expect(season.stop.month).to eq(8)
    end

    it 'should stop on the 15th' do
      expect(season.stop.day).to eq(15)
    end
  end

  context 'given'

  it 'should return current year with a too early year' do
    Timecop.freeze Date.new(2012, 12, 14)
    season = Season.new 1972
    expect(season.start.year).to eq(2012)
  end

  it 'should return the current year with a too late year' do
    Timecop.freeze Date.new(2012, 12, 14)
    season = Season.new 2112
    expect(season.start.year).to eq(2012)
  end
end

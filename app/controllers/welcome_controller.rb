require 'date'

class WelcomeController < ApplicationController
  def index
    @next_meeting = Meeting.next
    if @next_meeting
      @meeting_layout = 'next_meeting'
    else
      @meeting_layout = 'no_meetings'
    end
    @texture = Texture.find_by_label('welcome')
  end
end

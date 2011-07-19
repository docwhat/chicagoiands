require 'date'

class WelcomeController < ApplicationController
  def index
    @next_meeting = Meeting.next
  end

end

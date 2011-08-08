require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test "saving 'body' updates 'rendered'" do
    meeting = meetings :past
    meeting.body = "one _two_ three"
    meeting.rendered = "random"
    meeting.save!
    assert meeting.rendered == "<p>one <em>two</em> three</p>\n"
  end
end

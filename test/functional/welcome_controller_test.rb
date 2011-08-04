require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get a no new meetings message" do
    meetings(:future).delete
    get :index
    assert_response :success
  end

end

require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get fql" do
    get :fql
    assert_response :success
  end

end

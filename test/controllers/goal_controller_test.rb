require "test_helper"

class GoalControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get goal_show_url
    assert_response :success
  end
end

require "test_helper"

class RoadControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get road_show_url
    assert_response :success
  end
end

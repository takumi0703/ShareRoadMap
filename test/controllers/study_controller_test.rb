require "test_helper"

class StudyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get study_new_url
    assert_response :success
  end
end

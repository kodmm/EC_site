require 'test_helper'

class Admins::TopControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admins_top_top_url
    assert_response :success
  end

end

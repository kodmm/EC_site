require 'test_helper'

class EndUsers::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_items_index_url
    assert_response :success
  end

  test "should get top" do
    get end_users_items_top_url
    assert_response :success
  end

  test "should get show" do
    get end_users_items_show_url
    assert_response :success
  end

end

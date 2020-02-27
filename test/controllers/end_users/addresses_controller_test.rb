require 'test_helper'

class EndUsers::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get end_users_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get end_users_addresses_create_url
    assert_response :success
  end

end

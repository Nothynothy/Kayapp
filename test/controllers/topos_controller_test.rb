require 'test_helper'

class ToposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topos_index_url
    assert_response :success
  end

  test "should get show" do
    get topos_show_url
    assert_response :success
  end

end

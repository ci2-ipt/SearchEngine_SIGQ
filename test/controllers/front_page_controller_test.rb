require "test_helper"

class FrontPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_page_index_url
    assert_response :success
  end
end

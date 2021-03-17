require "test_helper"

class AboutPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get about_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get about_pages_about_url
    assert_response :success
  end
end

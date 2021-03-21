require "test_helper"

class FootersControllerTest < ActionDispatch::IntegrationTest
  test "should get worldof" do
    get footers_worldof_url
    assert_response :success
  end

  test "should get policy" do
    get footers_policy_url
    assert_response :success
  end

  test "should get privacy" do
    get footers_privacy_url
    assert_response :success
  end

  test "should get help" do
    get footers_help_url
    assert_response :success
  end

  test "should get contact" do
    get footers_contact_url
    assert_response :success
  end
end

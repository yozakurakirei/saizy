require "test_helper"

class SimilarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get similars_index_url
    assert_response :success
  end
end

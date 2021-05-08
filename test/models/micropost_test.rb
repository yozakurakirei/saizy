require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:admin)
    @micropost = @user.microposts.build(title: "hello!", content: "I'm saizy!", user_id: @user.id)
  end

  test "should be valid?" do
    assert @micropost.valid?
  end

  test "Valid if user.id is nil" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content presence" do
    @micropost.content = "  "
    assert_not @micropost.valid?
  end

  test "title presence" do
    @micropost.title = "  "
    assert_not @micropost.valid?
  end
  
  test "title lengths 140" do
    @micropost.title = "a" * 141
    assert_not @micropost.valid?
  end

  test "The new one is coming first" do
    assert_equal microposts(:most_recent), Micropost.first 
  end
end

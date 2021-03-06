require "test_helper"

class UserTest < ActiveSupport::TestCase
  # def setup
  #   @user = User.new(name: "admin", email: "admin@example.com",
  #                    password: "password", password_confirmation: "password")
  # end

  # test "name blank is not good" do
  #   @user.name = " "
  #   assert_not @user.valid?
  # end

  # test "email blank is not good" do
  #   @user.name = " "
  #   assert_not @user.valid?
  # end

  # test "neme limit" do
  #   @user.name = "a" * 31
  #   assert_not @user.valid?
  # end

  # test "email limit" do
  #   @user.email = "a" * 244 + "@example.com"
  #   assert_not @user.valid?
  # end

  # test "do not pass strage email" do
  #   valid_adds = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  #     first.last@foo.jp alice+bob@baz.cn]
  #   valid_adds.each do |valid_add|
  #     @user.email = valid_add
  #     assert @user.valid?,"失敗したアドレス:#{valid_add.inspect}"
  #   end
  # end

  # test "do not pass strage email format" do
  #   invalid_adds = %w[user@example,com user_at_foo.org user.name@example.
  #     foo@bar_baz.com foo@bar+baz.com]
  #   invalid_adds.each do |invalid_add|
  #     @user.email = invalid_add
  #     assert_not @user.valid?,
  #     "失敗したアドレス:#{invalid_add.inspect}"
  #   end  
  # end

  # test "Duplicate names emails are not allowed" do
  #   dupricate_user = @user.dup
  #   @user.save
  #   assert_not dupricate_user.valid?
  # end

  # test "password blank is not good" do
  #   @user.password = @user.password_confirmation = " " * 6
  #   assert_not @user.valid?
  # end

  # test "password must be 6 characters or more" do
  #   @user.password = @user.password_confirmation = "a" * 5
  #   assert_not @user.valid?
  # end

  # test "authentication? no digest for false" do
  #   assert_not @user.authenticated?(:remember, '')
  # end

  # 削除のテスト
  # test "user micropost destroy" do
  #   @user.save 
  #   @user.microposts.create!(content: "bar")
  #   @user.microposts.create!(title: "foo")
  #   assert_difference 'Micropost.count', -1 do
  #     @user.destroy
  #   end
  # end

  test "should follow and unfollow a user" do
    michael = users(:michael)
    archer = users(:archer)
    assert_not michael.following?(archer)
    michael.follow(archer)
    assert michael.following?(archer)
    michael.unfollow(archer)
    assert_not michael.following?(archer)
  end

  test "saizy post" do 
    michael = users(:michael)
    archer = users(:archer)
    lana = users(:lana)

    # フォロー相手の投稿を確認
    lana.saizies.each do |post_following|
      assert michael.feed.include?(post_following)
    end
    # 自分の投稿を確認
    michael.saizies.each do |post_self|
      assert.michael.feed.include?(post_self)
    end
    # フォローしていない人
    archer.saizies.each do |post_unfollowed|
      assert.archer.feed.include?(post_unfollowed)
    end
  end
end

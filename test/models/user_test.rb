require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "yama", email: "yama@example.com",
                     password: "yama0123", password_confirmation: "yama0123")
  end

  test "name blank is not good" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email blank is not good" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "neme limit" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end

  test "email limit" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "do not pass strage email" do
    valid_adds = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_adds.each do |valid_add|
      @user.email = valid_add
      assert @user.valid?,
      "失敗したアドレス:#{valid_add.inspect}"
    end
  end

  test "do not pass strage email format" do
    invalid_adds = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_adds.each do |invalid_add|
      @user.email = invalid_add
      assert_not @user.valid?,
      "失敗したアドレス:#{invalid_add.inspect}"
    end  
  end

  test "Duplicate names emails are not allowed" do
    dupricate_user = @user.dup
    @user.save
    assert_not dupricate_user.valid?
  end

  test "is email converted to lower-case?" do
    mixed_email = "ADmin@ExAMPle.CoM"
    @user.email = mixed_email
    @user.save
    assert_equal mixed_email.downcase, @user.reload.email
  end

  test "password blank is not good" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password must be 6 characters or more" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end

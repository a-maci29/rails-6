require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
  end

  test "successful edit with friendly forwarding" do
    log_in_as(@user)
    get edit_user_path(@user)
    name = "Rat City"
    email = "radrats@gmail.com"
    patch user_path(@user), params: { user: {name:  name,
                                       email: email,
                                       password:              "",
                                       password_confirmation: ""  } }

    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  
      ### How does the above optimize the code below?
  # test "successful edit" do
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user), params: { user: { name: "",
  #                                             email: "foo@invalid",
  #                                             password:              "foo",
  #                                             password_confirmation: "bar"}}
  #   assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal name, @user.name
  #   assert_equal email, @user.email
  # end
end

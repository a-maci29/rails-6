require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                          email: "user@example.com",
                                          password:         "password",
                                          password_confirmation: "password" } 
                                }
    end
  end
end

# test "valid signup information" do
#   get signup_path
#   assert_difference 'User.count', 1 do
#     post users_path, params: { user: { name:  "Example User",
#                                        email: "user@example.com",
#                                        password:              "password",
#                                        password_confirmation: "password" } }
#   end
#   follow_redirect!
#   assert_template 'users/show'
# end
# end



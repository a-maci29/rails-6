require 'test helper'

class UserSignupTest < ActionDispatch::IntegrationTest

    test "valid signup information" do
        get signup_path
    assert_difference 'User.count', 1 do
        post users_path, params: { user: {
            name: "Example User",
            email: "sample@sample.com",
            password: "password"
            password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.FILL_IN
    end
end

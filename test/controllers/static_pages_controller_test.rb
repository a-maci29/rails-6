require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Ruby on Rails tutorial app"
  end

  test "should get help" do
    get help_path
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Ruby on Rails tutorial app"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end

  test "should get contact" do
    get contact_path
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Ruby on Rails tutorial app"
  end
end

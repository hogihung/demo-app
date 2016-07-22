require "test_helper"

class WelcomePageTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Demo-App"
  end
end

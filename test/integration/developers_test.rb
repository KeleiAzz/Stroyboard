require 'test_helper'

class DevelopersTest < ActionDispatch::IntegrationTest

  fixtures :admins
  fixtures :developers

  def setup
    @developer = admins(:one)
  end

  test "login via https" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer3@ncsu.edu", password: "MyPassword"}
    assert_equal '/home', path

  end



end

require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  fixtures :admins
  fixtures :developers

  def setup
    @admin = admins(:one)
    @developer = developers(:one)
  end

  test "Admin can login" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

  end

  test "Developer can login" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

  end

end

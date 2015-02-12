require 'test_helper'

class AdminTest < ActionDispatch::IntegrationTest

  fixtures :admins
  fixtures :developers

  def setup
    @admin = admins(:one)
  end

  test "login and browse site" do
    # login via https
    https!
    get "/login"
    assert_response :success

    post login_path, session: {email: "MyAdmin1@ncsu.edu", password: "MyPassword"}
    assert_equal 'a', flash[:danger]
    assert_equal '/home', path

    https!(false)
    get "/posts/all"
    assert_response :success
    assert assigns(:products)
  end

end

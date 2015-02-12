require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  fixtures :admins
  fixtures :developers

  def setup
    @admin = admins(:one)
    @developer = developers(:one)
    @session = []
  end

  test "login" do

    log_in @admin

    assert_equal 'welcome, admin', flash[:notice]

  end

end

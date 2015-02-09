require 'test_helper'

class AdminTest < ActiveSupport::TestCase

  def setup
    @admin = Admin.new( name: "MyName",
                        email: "MyEmail@ncsu.edu",
                        password: "MyPassword",
                        password_digest: BCrypt::Password.create('MyPassword') )
  end

  test "name should have a maximum length" do
    @admin.name = "a" * 33
    assert_not @admin.valid?
  end

  test "email addresses should be unique" do
    duplicate_admin = @admin.dup
    duplicate_admin.email = @admin.email.upcase
    @admin.save
    assert_not duplicate_admin.valid?
  end

  test "email should have a maximum length" do
    @admin.email = "a" * 60 + "@ncsu.edu"
    assert_not @admin.valid?
  end

  test "password should have a minimum length" do
    @admin.password = "a" * 5
    assert_not @admin.valid?
  end

  test "password should have a maximum length" do
    @admin.password = "a" * 33
    assert_not @admin.valid?
  end

end

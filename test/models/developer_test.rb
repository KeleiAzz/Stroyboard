require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase

  def setup
    @developer = Developer.new( name: "MyName",
                                email: "MyEmail@ncsu.edu",
                                password: "MyPassword",
                                password_digest: BCrypt::Password.create('MyPassword') )
  end

  test "name should have a maximum length" do
    @developer.name = "a" * 33
    assert_not @developer.valid?
  end

  test "email addresses should be unique" do
    duplicate_developer = @developer.dup
    duplicate_developer.email = @developer.email.upcase
    @developer.save
    assert_not duplicate_developer.valid?
  end

  test "email should have a maximum length" do
    @developer.email = "a" * 60 + "@ncsu.edu"
    assert_not @developer.valid?
  end

  test "password should have a minimum length" do
    @developer.password = "a" * 5
    assert_not @developer.valid?
  end

  test "password should have a maximum length" do
    @developer.password = "a" * 33
    assert_not @developer.valid?
  end

end

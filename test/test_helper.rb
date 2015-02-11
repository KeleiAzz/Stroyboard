ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "bcrypt"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  @session = []
  def log_in(user)
    if user.class == Admin
      session[:admin_id] = user.id
      session[:developer_id] = nil
      flash[:notice] = "welcome, admin"
    elsif user.class == Developer
      session[:admin_id] = nil
      session[:developer_id] = user.id
      # session[:admin_id] = admin.id
      flash[:notice] = "welcome, developer"
    end
  end

end

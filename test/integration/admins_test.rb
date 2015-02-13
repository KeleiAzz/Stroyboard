require 'test_helper'

class AdminsTest < ActionDispatch::IntegrationTest

  fixtures :admins
  fixtures :developers
  fixtures :projects
  fixtures :stories

  def setup
    @admin = admins(:one)
    @developer = developers(:one)
    @project = projects(:one)
    @story = stories(:one)
  end

  test "login via https" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

  end

  test "admin can create developer" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    get "/developers/new"
    assert_response :success

    post  "/developers", developer: {email: "Developer3@ncsu.edu", password: "Password",
                      name: "Developer3", project_id: nil}

    assert_equal "Developer was successfully created, a confirmation email has been sent to the developer's mailbox",
                  flash[:notice]

  end

  test "admin can remove developer" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete developer_path(@developer.id)
    assert_equal "Developer was successfully destroyed.", flash[:notice]

  end

  test "admin can create project" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    get "/projects/new"
    assert_response :success

    post  "/projects", project: { name: "TestProject", description: "SomeDescription" }

    assert_equal "Project was successfully created.", flash[:notice]

  end

  test "admin can remove project" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete project_path(@project.id)
    assert_equal "Project was successfully destroyed.", flash[:notice]

  end

end

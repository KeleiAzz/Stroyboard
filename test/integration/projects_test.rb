require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest

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

  test "Project can be created by admin" do

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

  test "Project cannot be created by developer" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    get "/projects/new"
    assert_redirected_to "/projects"
    assert_equal "Only access by Admin.", flash[:notice]

  end

  test "Project can be destroyed by admin" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete project_path(@project.id)
    assert_equal "Project was successfully destroyed.", flash[:notice]

  end

  test "Project cannot be destroyed by developer" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete project_path(@project.id)
    assert_redirected_to "/projects"
    assert_equal "Only access by Admin.", flash[:notice]

  end

end

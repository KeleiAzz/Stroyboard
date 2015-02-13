require 'test_helper'

class StoriesTest < ActionDispatch::IntegrationTest

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

  test "Story cannot be created by admin" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    get "/stories/new"
    assert_redirected_to projects_path
    assert_equal "Can only be created by developer", flash[:notice]

  end

  test "Story can be created by developer" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    get "/stories/new"
    assert_response :success

    post  "/stories", story: { title: "TestStory", description: "SomeDescription",
                                 point: 1, project_id: @project.id, stage:  "In Dev",
                                 developer_id: @developer.id, content: "SomeContent" }

    assert_equal "Story was successfully created.", flash[:notice]

  end

  test "Story cannot be destroyed by admin" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Admin1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete story_path(@story.id)
    assert_redirected_to project_path(@story.developer_id)
    assert_equal "You are not permited to delete this story", flash[:notice]

  end

  test "Story can be destroyed by developer assigned to corresponding project" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    delete story_path(@story.id)
    assert_equal "Story was successfully destroyed.", flash[:notice]

  end

  test "Story can not be destroyed by developer assigned to differnt projects" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer2@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete story_path(@story.id)
    assert_equal "You are not permited to delete this story", flash[:notice]

  end

end

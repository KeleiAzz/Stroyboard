require 'test_helper'

class DevelopersTest < ActionDispatch::IntegrationTest

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

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

  end

  test "developer can create story" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    post  "/stories", story: { title: "TestStory", description: "SomeDescription",
                               point: 10, content: "SomeContent", project_id: 1,
                               stage: "In Dev", developer_id: @developer.id }

    assert_equal "Story was successfully created.", flash[:notice]

  end

  test "developer can remove story" do

    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", session: {email: "Developer1@ncsu.edu", password: "Password"}
    assert_equal '/home', path

    https!
    delete story_path(@story.id)
    assert_equal "Story was successfully destroyed.", flash[:notice]

  end

end

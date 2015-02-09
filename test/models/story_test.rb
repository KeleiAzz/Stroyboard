require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  def setup
    @story = Story.new( title: "MyTitle",
                        description: "MyDescription",
                        point: 10,
                        content: "MyContent",
                        project_id: 1,
                        stage: "In Dev",
                        developer_id: 1 )
  end

  test "name should have a maximum length" do
    @story.title = "a" * 33
    assert_not @story.valid?
  end

  test "description should have a maximum length" do
    @story.description = "a" * 256
    assert_not @story.valid?
  end

  test "point should have a minimum value" do
    @story.point = -1
    assert_not @story.valid?
  end

  test "point should have a maximum value" do
    @story.point = 101
    assert_not @story.valid?
  end

  test "content should have a maximum length" do
    @story.content = "a" * 256
    assert_not @story.valid?
  end

end

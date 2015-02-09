require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = Project.new( name: "MyName",
                            description: "MyDescription" )
  end

  test "name should have a maximum length" do
    @project.name = "a" * 33
    assert_not @project.valid?
  end

  test "description should have a maximum length" do
    @project.name = "a" * 256
    assert_not @project.valid?
  end

end

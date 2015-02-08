require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @developer = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:developers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create developer" do
    assert_difference('Developer.count') do
      post :create, developer: { admin: @developer.admin, email: @developer.email, name: @developer.name }
    end

    assert_redirected_to user_path(assigns(:developer))
  end

  test "should show developer" do
    get :show, id: @developer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @developer
    assert_response :success
  end

  test "should update developer" do
    patch :update, id: @developer, developer: { admin: @developer.admin, email: @developer.email, name: @developer.name }
    assert_redirected_to user_path(assigns(:developer))
  end

  test "should destroy developer" do
    assert_difference('Developer.count', -1) do
      delete :destroy, id: @developer
    end

    assert_redirected_to users_path
  end
end

require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:one)
    session[:admin_id] = @admin.id
  end

  test "should have index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post :create, admin: { email: 'a' + @admin.email,
                             password: 'MyPassword',
                             name: @admin.name }
    end

    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should show admin" do
    get :show, id: @admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin
    assert_response :success
  end

  test "should update admin" do
    patch :update, id: @admin, admin: { email: 'a' + @admin.email,
                                        password: 'MyPassword',
                                        name: @admin.name }
    assert_redirected_to @admin
  end

end

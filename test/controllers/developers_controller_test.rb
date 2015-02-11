require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  setup do
    @developer = developers(:one)
    @admin = admins(:one)
    session[:admin_id] = @admin.id
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
      post :create, developer: { email: 'a' + @developer.email,
                             password: 'MyPassword',
                             name: @developer.name }
    end

    assert_redirected_to developer_path(assigns(:developer))
  end
=begin
  test "should show developer" do
    get :show, id: @developer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @developer
    assert_response :success
  end

  test "should update developer" do
    patch :update, id: @developer, developer: { name: @developer.name }
    assert_redirected_to developer_path(assigns(:developer))
  end
=end
end

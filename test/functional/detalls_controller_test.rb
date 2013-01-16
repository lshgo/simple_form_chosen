require 'test_helper'

class DetallsControllerTest < ActionController::TestCase
  setup do
    @detall = detalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detall" do
    assert_difference('Detall.count') do
      post :create, detall: { age: @detall.age, ihone: @detall.ihone }
    end

    assert_redirected_to detall_path(assigns(:detall))
  end

  test "should show detall" do
    get :show, id: @detall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detall
    assert_response :success
  end

  test "should update detall" do
    put :update, id: @detall, detall: { age: @detall.age, ihone: @detall.ihone }
    assert_redirected_to detall_path(assigns(:detall))
  end

  test "should destroy detall" do
    assert_difference('Detall.count', -1) do
      delete :destroy, id: @detall
    end

    assert_redirected_to detalls_path
  end
end

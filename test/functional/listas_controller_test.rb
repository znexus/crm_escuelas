require 'test_helper'

class ListasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lista" do
    assert_difference('Lista.count') do
      post :create, :lista => { }
    end

    assert_redirected_to lista_path(assigns(:lista))
  end

  test "should show lista" do
    get :show, :id => listas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => listas(:one).id
    assert_response :success
  end

  test "should update lista" do
    put :update, :id => listas(:one).id, :lista => { }
    assert_redirected_to lista_path(assigns(:lista))
  end

  test "should destroy lista" do
    assert_difference('Lista.count', -1) do
      delete :destroy, :id => listas(:one).id
    end

    assert_redirected_to listas_path
  end
end

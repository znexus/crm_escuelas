require 'test_helper'

class PlantillasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plantillas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plantilla" do
    assert_difference('Plantilla.count') do
      post :create, :plantilla => { }
    end

    assert_redirected_to plantilla_path(assigns(:plantilla))
  end

  test "should show plantilla" do
    get :show, :id => plantillas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => plantillas(:one).id
    assert_response :success
  end

  test "should update plantilla" do
    put :update, :id => plantillas(:one).id, :plantilla => { }
    assert_redirected_to plantilla_path(assigns(:plantilla))
  end

  test "should destroy plantilla" do
    assert_difference('Plantilla.count', -1) do
      delete :destroy, :id => plantillas(:one).id
    end

    assert_redirected_to plantillas_path
  end
end

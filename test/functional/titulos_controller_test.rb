require File.dirname(__FILE__) + '/../test_helper'

class TitulosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:titulos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_titulo
    assert_difference('Titulo.count') do
      post :create, :titulo => { }
    end

    assert_redirected_to titulo_path(assigns(:titulo))
  end

  def test_should_show_titulo
    get :show, :id => titulos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => titulos(:one).id
    assert_response :success
  end

  def test_should_update_titulo
    put :update, :id => titulos(:one).id, :titulo => { }
    assert_redirected_to titulo_path(assigns(:titulo))
  end

  def test_should_destroy_titulo
    assert_difference('Titulo.count', -1) do
      delete :destroy, :id => titulos(:one).id
    end

    assert_redirected_to titulos_path
  end
end

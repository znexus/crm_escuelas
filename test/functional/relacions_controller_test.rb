require 'test_helper'

class RelacionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:relacions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_relacion
    assert_difference('Relacion.count') do
      post :create, :relacion => { }
    end

    assert_redirected_to relacion_path(assigns(:relacion))
  end

  def test_should_show_relacion
    get :show, :id => relacions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => relacions(:one).id
    assert_response :success
  end

  def test_should_update_relacion
    put :update, :id => relacions(:one).id, :relacion => { }
    assert_redirected_to relacion_path(assigns(:relacion))
  end

  def test_should_destroy_relacion
    assert_difference('Relacion.count', -1) do
      delete :destroy, :id => relacions(:one).id
    end

    assert_redirected_to relacions_path
  end
end

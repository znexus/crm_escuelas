require 'test_helper'

class TipoVinculosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_vinculos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tipo_vinculo
    assert_difference('TipoVinculo.count') do
      post :create, :tipo_vinculo => { }
    end

    assert_redirected_to tipo_vinculo_path(assigns(:tipo_vinculo))
  end

  def test_should_show_tipo_vinculo
    get :show, :id => tipo_vinculos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tipo_vinculos(:one).id
    assert_response :success
  end

  def test_should_update_tipo_vinculo
    put :update, :id => tipo_vinculos(:one).id, :tipo_vinculo => { }
    assert_redirected_to tipo_vinculo_path(assigns(:tipo_vinculo))
  end

  def test_should_destroy_tipo_vinculo
    assert_difference('TipoVinculo.count', -1) do
      delete :destroy, :id => tipo_vinculos(:one).id
    end

    assert_redirected_to tipo_vinculos_path
  end
end

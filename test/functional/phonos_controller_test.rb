require 'test_helper'

class PhonosControllerTest < ActionController::TestCase
  setup do
    @phono = phonos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phonos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phono" do
    assert_difference('Phono.count') do
      post :create, phono: @phono.attributes
    end

    assert_redirected_to phono_path(assigns(:phono))
  end

  test "should show phono" do
    get :show, id: @phono.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phono.to_param
    assert_response :success
  end

  test "should update phono" do
    put :update, id: @phono.to_param, phono: @phono.attributes
    assert_redirected_to phono_path(assigns(:phono))
  end

  test "should destroy phono" do
    assert_difference('Phono.count', -1) do
      delete :destroy, id: @phono.to_param
    end

    assert_redirected_to phonos_path
  end
end

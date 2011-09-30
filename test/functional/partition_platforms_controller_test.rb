require 'test_helper'

class PartitionPlatformsControllerTest < ActionController::TestCase
  setup do
    @partition_platform = partition_platforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partition_platforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partition_platform" do
    assert_difference('PartitionPlatform.count') do
      post :create, partition_platform: @partition_platform.attributes
    end

    assert_redirected_to partition_platform_path(assigns(:partition_platform))
  end

  test "should show partition_platform" do
    get :show, id: @partition_platform.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partition_platform.to_param
    assert_response :success
  end

  test "should update partition_platform" do
    put :update, id: @partition_platform.to_param, partition_platform: @partition_platform.attributes
    assert_redirected_to partition_platform_path(assigns(:partition_platform))
  end

  test "should destroy partition_platform" do
    assert_difference('PartitionPlatform.count', -1) do
      delete :destroy, id: @partition_platform.to_param
    end

    assert_redirected_to partition_platforms_path
  end
end

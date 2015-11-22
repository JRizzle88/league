require 'test_helper'

class MasteriesControllerTest < ActionController::TestCase
  setup do
    @mastery = masteries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:masteries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mastery" do
    assert_difference('Mastery.count') do
      post :create, mastery: {  }
    end

    assert_redirected_to mastery_path(assigns(:mastery))
  end

  test "should show mastery" do
    get :show, id: @mastery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mastery
    assert_response :success
  end

  test "should update mastery" do
    patch :update, id: @mastery, mastery: {  }
    assert_redirected_to mastery_path(assigns(:mastery))
  end

  test "should destroy mastery" do
    assert_difference('Mastery.count', -1) do
      delete :destroy, id: @mastery
    end

    assert_redirected_to masteries_path
  end
end

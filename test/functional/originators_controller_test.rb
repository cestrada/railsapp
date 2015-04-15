require 'test_helper'

class OriginatorsControllerTest < ActionController::TestCase
  setup do
    @originator = originators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:originators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create originator" do
    assert_difference('Originator.count') do
      post :create, originator: { name: @originator.name }
    end

    assert_redirected_to originator_path(assigns(:originator))
  end

  test "should show originator" do
    get :show, id: @originator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @originator
    assert_response :success
  end

  test "should update originator" do
    put :update, id: @originator, originator: { name: @originator.name }
    assert_redirected_to originator_path(assigns(:originator))
  end

  test "should destroy originator" do
    assert_difference('Originator.count', -1) do
      delete :destroy, id: @originator
    end

    assert_redirected_to originators_path
  end
end

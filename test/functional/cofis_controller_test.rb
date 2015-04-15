require 'test_helper'

class CofisControllerTest < ActionController::TestCase
  setup do
    @cofi = cofis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cofis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cofi" do
    assert_difference('Cofi.count') do
      post :create, cofi: { name: @cofi.name }
    end

    assert_redirected_to cofi_path(assigns(:cofi))
  end

  test "should show cofi" do
    get :show, id: @cofi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cofi
    assert_response :success
  end

  test "should update cofi" do
    put :update, id: @cofi, cofi: { name: @cofi.name }
    assert_redirected_to cofi_path(assigns(:cofi))
  end

  test "should destroy cofi" do
    assert_difference('Cofi.count', -1) do
      delete :destroy, id: @cofi
    end

    assert_redirected_to cofis_path
  end
end

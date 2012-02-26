require 'test_helper'

class FiliationsControllerTest < ActionController::TestCase
  setup do
    @filiation = filiations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filiations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filiation" do
    assert_difference('Filiation.count') do
      post :create, filiation: @filiation.attributes
    end

    assert_redirected_to filiation_path(assigns(:filiation))
  end

  test "should show filiation" do
    get :show, id: @filiation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filiation
    assert_response :success
  end

  test "should update filiation" do
    put :update, id: @filiation, filiation: @filiation.attributes
    assert_redirected_to filiation_path(assigns(:filiation))
  end

  test "should destroy filiation" do
    assert_difference('Filiation.count', -1) do
      delete :destroy, id: @filiation
    end

    assert_redirected_to filiations_path
  end
end

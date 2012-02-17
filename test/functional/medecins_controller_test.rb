require 'test_helper'

class MedecinsControllerTest < ActionController::TestCase
  setup do
    @medecin = medecins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medecins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medecin" do
    assert_difference('Medecin.count') do
      post :create, medecin: @medecin.attributes
    end

    assert_redirected_to medecin_path(assigns(:medecin))
  end

  test "should show medecin" do
    get :show, id: @medecin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medecin
    assert_response :success
  end

  test "should update medecin" do
    put :update, id: @medecin, medecin: @medecin.attributes
    assert_redirected_to medecin_path(assigns(:medecin))
  end

  test "should destroy medecin" do
    assert_difference('Medecin.count', -1) do
      delete :destroy, id: @medecin
    end

    assert_redirected_to medecins_path
  end
end

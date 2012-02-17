require 'test_helper'

class GroupeEnfantsControllerTest < ActionController::TestCase
  setup do
    @groupe_enfant = groupe_enfants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupe_enfants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupe_enfant" do
    assert_difference('GroupeEnfant.count') do
      post :create, groupe_enfant: @groupe_enfant.attributes
    end

    assert_redirected_to groupe_enfant_path(assigns(:groupe_enfant))
  end

  test "should show groupe_enfant" do
    get :show, id: @groupe_enfant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupe_enfant
    assert_response :success
  end

  test "should update groupe_enfant" do
    put :update, id: @groupe_enfant, groupe_enfant: @groupe_enfant.attributes
    assert_redirected_to groupe_enfant_path(assigns(:groupe_enfant))
  end

  test "should destroy groupe_enfant" do
    assert_difference('GroupeEnfant.count', -1) do
      delete :destroy, id: @groupe_enfant
    end

    assert_redirected_to groupe_enfants_path
  end
end

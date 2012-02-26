require 'test_helper'

class EnfantsControllerTest < ActionController::TestCase
  setup do
    @enfant = enfants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enfants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enfant" do
    assert_difference('Enfant.count') do
      post :create, enfant: @enfant.attributes
    end

    assert_redirected_to enfant_path(assigns(:enfant))
  end

  test "should show enfant" do
    get :show, id: @enfant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enfant
    assert_response :success
  end

  test "should update enfant" do
    put :update, id: @enfant, enfant: @enfant.attributes
    assert_redirected_to enfant_path(assigns(:enfant))
  end

  test "should destroy enfant" do
    assert_difference('Enfant.count', -1) do
      delete :destroy, id: @enfant
    end

    assert_redirected_to enfants_path
  end
end

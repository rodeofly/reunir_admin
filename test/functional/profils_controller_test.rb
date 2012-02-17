require 'test_helper'

class ProfilsControllerTest < ActionController::TestCase
  setup do
    @profil = profils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profil" do
    assert_difference('Profil.count') do
      post :create, profil: @profil.attributes
    end

    assert_redirected_to profil_path(assigns(:profil))
  end

  test "should show profil" do
    get :show, id: @profil
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profil
    assert_response :success
  end

  test "should update profil" do
    put :update, id: @profil, profil: @profil.attributes
    assert_redirected_to profil_path(assigns(:profil))
  end

  test "should destroy profil" do
    assert_difference('Profil.count', -1) do
      delete :destroy, id: @profil
    end

    assert_redirected_to profils_path
  end
end

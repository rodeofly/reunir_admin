require 'test_helper'

class GroupeParentsControllerTest < ActionController::TestCase
  setup do
    @groupe_parent = groupe_parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupe_parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupe_parent" do
    assert_difference('GroupeParent.count') do
      post :create, groupe_parent: @groupe_parent.attributes
    end

    assert_redirected_to groupe_parent_path(assigns(:groupe_parent))
  end

  test "should show groupe_parent" do
    get :show, id: @groupe_parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupe_parent
    assert_response :success
  end

  test "should update groupe_parent" do
    put :update, id: @groupe_parent, groupe_parent: @groupe_parent.attributes
    assert_redirected_to groupe_parent_path(assigns(:groupe_parent))
  end

  test "should destroy groupe_parent" do
    assert_difference('GroupeParent.count', -1) do
      delete :destroy, id: @groupe_parent
    end

    assert_redirected_to groupe_parents_path
  end
end

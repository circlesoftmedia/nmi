require 'test_helper'

class Webmaster::CategoriesControllerTest < ActionController::TestCase
  setup do
    @webmaster_category = webmaster_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webmaster_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webmaster_category" do
    assert_difference('Webmaster::Category.count') do
      post :create, webmaster_category: @webmaster_category.attributes
    end

    assert_redirected_to webmaster_category_path(assigns(:webmaster_category))
  end

  test "should show webmaster_category" do
    get :show, id: @webmaster_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webmaster_category
    assert_response :success
  end

  test "should update webmaster_category" do
    put :update, id: @webmaster_category, webmaster_category: @webmaster_category.attributes
    assert_redirected_to webmaster_category_path(assigns(:webmaster_category))
  end

  test "should destroy webmaster_category" do
    assert_difference('Webmaster::Category.count', -1) do
      delete :destroy, id: @webmaster_category
    end

    assert_redirected_to webmaster_categories_path
  end
end

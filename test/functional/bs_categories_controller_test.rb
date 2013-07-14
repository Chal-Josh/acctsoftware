require 'test_helper'

class BsCategoriesControllerTest < ActionController::TestCase
  setup do
    @bs_category = bs_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bs_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bs_category" do
    assert_difference('BsCategory.count') do
      post :create, bs_category: { credit_impact: @bs_category.credit_impact, debit_impact: @bs_category.debit_impact, name: @bs_category.name }
    end

    assert_redirected_to bs_category_path(assigns(:bs_category))
  end

  test "should show bs_category" do
    get :show, id: @bs_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bs_category
    assert_response :success
  end

  test "should update bs_category" do
    put :update, id: @bs_category, bs_category: { credit_impact: @bs_category.credit_impact, debit_impact: @bs_category.debit_impact, name: @bs_category.name }
    assert_redirected_to bs_category_path(assigns(:bs_category))
  end

  test "should destroy bs_category" do
    assert_difference('BsCategory.count', -1) do
      delete :destroy, id: @bs_category
    end

    assert_redirected_to bs_categories_path
  end
end

require 'test_helper'

class SubAccountsControllerTest < ActionController::TestCase
  setup do
    @sub_account = sub_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_account" do
    assert_difference('SubAccount.count') do
      post :create, sub_account: { account_id: @sub_account.account_id, name: @sub_account.name }
    end

    assert_redirected_to sub_account_path(assigns(:sub_account))
  end

  test "should show sub_account" do
    get :show, id: @sub_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_account
    assert_response :success
  end

  test "should update sub_account" do
    put :update, id: @sub_account, sub_account: { account_id: @sub_account.account_id, name: @sub_account.name }
    assert_redirected_to sub_account_path(assigns(:sub_account))
  end

  test "should destroy sub_account" do
    assert_difference('SubAccount.count', -1) do
      delete :destroy, id: @sub_account
    end

    assert_redirected_to sub_accounts_path
  end
end

require "test_helper"

class CurrentAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_account = current_accounts(:one)
  end

  test "should get index" do
    get current_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_current_account_url
    assert_response :success
  end

  test "should create current_account" do
    assert_difference('CurrentAccount.count') do
      post current_accounts_url, params: { current_account: { balance: @current_account.balance, credit: @current_account.credit, date: @current_account.date, debit: @current_account.debit, description: @current_account.description, user_account_id: @current_account.user_account_id } }
    end

    assert_redirected_to current_account_url(CurrentAccount.last)
  end

  test "should show current_account" do
    get current_account_url(@current_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_current_account_url(@current_account)
    assert_response :success
  end

  test "should update current_account" do
    patch current_account_url(@current_account), params: { current_account: { balance: @current_account.balance, credit: @current_account.credit, date: @current_account.date, debit: @current_account.debit, description: @current_account.description, user_account_id: @current_account.user_account_id } }
    assert_redirected_to current_account_url(@current_account)
  end

  test "should destroy current_account" do
    assert_difference('CurrentAccount.count', -1) do
      delete current_account_url(@current_account)
    end

    assert_redirected_to current_accounts_url
  end
end

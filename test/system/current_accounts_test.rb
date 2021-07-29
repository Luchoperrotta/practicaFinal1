require "application_system_test_case"

class CurrentAccountsTest < ApplicationSystemTestCase
  setup do
    @current_account = current_accounts(:one)
  end

  test "visiting the index" do
    visit current_accounts_url
    assert_selector "h1", text: "Current Accounts"
  end

  test "creating a Current account" do
    visit current_accounts_url
    click_on "New Current Account"

    fill_in "Balance", with: @current_account.balance
    fill_in "Credit", with: @current_account.credit
    fill_in "Date", with: @current_account.date
    fill_in "Debit", with: @current_account.debit
    fill_in "Description", with: @current_account.description
    fill_in "User account", with: @current_account.user_account_id
    click_on "Create Current account"

    assert_text "Current account was successfully created"
    click_on "Back"
  end

  test "updating a Current account" do
    visit current_accounts_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @current_account.balance
    fill_in "Credit", with: @current_account.credit
    fill_in "Date", with: @current_account.date
    fill_in "Debit", with: @current_account.debit
    fill_in "Description", with: @current_account.description
    fill_in "User account", with: @current_account.user_account_id
    click_on "Update Current account"

    assert_text "Current account was successfully updated"
    click_on "Back"
  end

  test "destroying a Current account" do
    visit current_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Current account was successfully destroyed"
  end
end

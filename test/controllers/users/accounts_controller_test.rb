require "test_helper"

class Users::AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get unsubscribe" do
    get users_accounts_unsubscribe_url
    assert_response :success
  end

  test "should get withdrawal" do
    get users_accounts_withdrawal_url
    assert_response :success
  end
end

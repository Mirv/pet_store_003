require 'test_helper'

class ApplicationHelperTest < ActiveSupport::TestCase

  test "logged in email shows" do
    @user = FactoryBot.create(:user, email: 'a@test.com')
    sign_in @user
    assert_match 'User: a@test.com', ApplicationHelper.logged_in_email(@user)
  end
end
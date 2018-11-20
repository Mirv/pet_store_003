require 'test_helper'

class ApplicationHelperTest < ActiveSupport::TestCase
  include ApplicationHelper

  test "logged in email shows" do
    @user = FactoryBot.build(:user, email: 'a@test.com')
    sign_in @user
    assert_match 'a@test.com', logged_in_email(@user)
  end

end
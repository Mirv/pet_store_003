require 'test_helper'

# Note changed name to the annonymous user to avoid devise conflicts

class NullUserPolicyTest < ActiveSupport::TestCase
  test "null user has same attributes" do
    @null_user = AnonymousUser.new
    assert @null_user.id.present?
    assert @null_user.email
    refute @null_user.admin
  end
end
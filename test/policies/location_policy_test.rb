require 'test_helper'

class LocationPolicyTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    sign_in @user
    @location = locations(:one)
    @policy = Pundit.policy(@user, @location)
  end
  
  def test_scope
  end

  test "index" do
    assert @policy = Pundit.policy(@user, Location).index?
  end
  
  test "show works" do
    assert @policy.show?
  end

  def test_create
    assert @policy.create?
  end
  
  test "new" do
    assert @policy.new?
  end

  def test_update
    @user = users(:admin)
    assert Pundit.policy(@user, @location).admin?
  end

  test "destroy as admin" do
    @user = users(:admin)
    assert Pundit.policy(@user, @location).destroy?
  end
end

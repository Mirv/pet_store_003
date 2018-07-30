require 'test_helper'

class PetPolicyTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    sign_in @user
    @pet = pets(:one)
    @policy = Pundit.policy(@user, @pet) # can't use this on Pet versus @pet
  end
  
  def test_scope
  end

  test "index" do
    assert @policy = Pundit.policy(@user, Pet).index?
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
    @pet.user_id = @user.id
    assert @policy.update?
  end

  test "destroy as admin" do
    @user.admin = true
    assert @policy.destroy?
  end
  
  test "only admin see pet owner transfer button" do
    refute @policy.admin?
  
    @admin = users(:admin)
    assert Pundit.policy(@admin, @pet).admin?
  end
end

require 'test_helper'

class PetPolicyTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.build(:user)
    sign_in @user
    @pet = FactoryBot.build(:pet)
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
    refute Pundit.policy(@user, @pet).admin?
    @pet.user_id = @user.id
    assert @policy.update?
  end

  test "destroy as admin" do
    refute Pundit.policy(@user, @pet).admin?
    @user = FactoryBot.build(:admin)
    assert Pundit.policy(@user, @pet).destroy?
  end
  

end

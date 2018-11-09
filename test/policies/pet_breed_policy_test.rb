require 'test_helper'

class PetBreedPolicyTest < ActiveSupport::TestCase
  def setup
    # @user = users(:one)
    @user = FactoryBot.build(:user)
    sign_in @user
    @petbreed = FactoryBot.build(:pet_breed)
    @policy = Pundit.policy(@user, @petbreed) # can't use this on Pet versus @petbreed
  end
  
  def test_scope
  end

  test "index" do
    assert @policy = Pundit.policy(@user, PetBreed).index?
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
    refute Pundit.policy(@user, @petbreed).admin?
    @user = FactoryBot.build(:admin)
    assert Pundit.policy(@user, @petbreed).admin?
  end

  test "destroy as admin" do
    refute Pundit.policy(@user, @petbreed).admin?
    @user = FactoryBot.build(:admin)
    assert Pundit.policy(@user, @petbreed).destroy?
  end
end

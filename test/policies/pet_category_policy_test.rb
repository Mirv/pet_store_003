require 'test_helper'

class PetCategoryPolicyTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    sign_in @user
    @pet_category = FactoryBot.create(:pet_category)
    @policy = Pundit.policy(@user, @pet_category) # can't use this on Pet versus @pet_category
  end
  
  def test_scope
  end

  test "index" do
    assert @policy = Pundit.policy(@user, PetCategory).index?
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
    refute Pundit.policy(@user, @pet_category).admin?
    @user = FactoryBot.create(:admin)
    assert Pundit.policy(@user, @pet_category).admin?
  end

  test "destroy as admin" do
    refute Pundit.policy(@user, @pet_category).admin?
    @user = FactoryBot.create(:admin)
    assert Pundit.policy(@user, @pet_category).destroy?
  end
end

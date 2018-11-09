require 'test_helper'

class PetCategoryTest < ActiveSupport::TestCase
  setup do
    @category = FactoryBot.create(:pet_category)
  end
  
  test "invalid without name" do
    @category.name = ""
    refute @category.valid?
  end
  
  test "invalid without description" do
    @category.description = ""
    refute @category.valid?
  end
end

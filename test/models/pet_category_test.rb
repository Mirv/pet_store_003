require 'test_helper'

class PetCategoryTest < ActiveSupport::TestCase
  setup do
    @category = pet_categories(:one)
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

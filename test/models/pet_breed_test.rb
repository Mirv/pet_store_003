require 'test_helper'

class PetBreedTest < ActiveSupport::TestCase
  setup do
    @breeds = FactoryBot.create(:pet_breed)
  end
  
  test "invalid without name" do
    @breeds.name = ""
    refute @breeds.valid?
  end
  
  test "invalid without description" do
    @breeds.description = ""
    refute @breeds.valid?
  end
  
  test "invalid without category" do
    @breeds.pet_category_id = nil
    refute @breeds.valid?
  end
end

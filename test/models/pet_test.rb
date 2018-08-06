require 'test_helper'

class PetTest < ActiveSupport::TestCase
  setup do
    @pet = pets(:one)
  end
  
  test "invalid without name" do
    @pet.name = ""
    refute @pet.valid?
  end
  
  test "invalid without age" do
    @pet.age = ""
    refute @pet.valid?
  end
  
  test "invalid without description" do
    @pet.description = ""
    refute @pet.valid?
  end
  
  test "invalid without breed" do
    @pet.pet_breed = nil
    refute @pet.valid?
  end
  
  test "invalid without location" do
    @pet.location_id = nil
    refute @pet.valid?
  end  
  
  test "invalid without user_id" do
    @pet.user_id = nil
    refute @pet.valid?
  end 
end

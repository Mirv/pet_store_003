require 'test_helper'

class PetTest < ActiveSupport::TestCase
  setup do
    @pet_breed = create(:pet_breed)

    @user = create(:user) do |user|
      loc = user.location.create(attributes_for(:location))
      @pet = user.pets.create(
          attributes_for(
            :pet,                         # default factory values
            location_id: loc.id,          # over riding a value in hash
            pet_breed_id: @pet_breed.id   # over riding a value in hash
          )
        )
    end
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
  
  # strategy is 1 valid check, check range first invalid on each end
  test "pet for sale scope" do
    sold = create(:pet, status: :sold)
    zero = create(:pet, status: :zero)
    for_sale = Pet.for_sale
    @pet.pet_published!
    assert for_sale.include?(@pet)
    refute for_sale.include?(sold)
    refute for_sale.include?(zero)
  end
  
  # strategy is check all valid, not boundaries
  test "pet for admin off scope" do
    removed = create(:pet, status: :removed)
    banned = create(:pet, status: :banned)
    admin_off = Pet.admin_off
    @pet.pet_suspended!
    assert admin_off.include?(@pet)
    assert admin_off.include?(removed)
    assert admin_off.include?(banned)
  end
  
  # strategy is check all valid, not boundaries
  test "pet for ordering" do
    payment_pending = create(:pet, status: :payment_pending)
    fulfilling_processing = create(:pet, status: :fulfilling_processing)
    ordering = Pet.ordering
    @pet.pet_ready_for_fulfillment!
    assert ordering.include?(@pet)
    assert ordering.include?(payment_pending)
    assert ordering.include?(fulfilling_processing)
  end
  
end

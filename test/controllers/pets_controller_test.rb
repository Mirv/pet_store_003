require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_breed = create(:pet_breed)

    @user = create(:user) do |user|
      loc = user.location.create(attributes_for(:location))
      @pet = user.pets.create(
          attributes_for(
            :pet, 
            location_id: loc.id, 
            pet_breed_id: @pet_breed.id
          )
        )
    end

    sign_in @user
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { age: @pet.age, description: @pet.description, location_id: @pet.location_id, name: @pet.name, pet_breed_id: @pet.pet_breed_id, user_id: @pet.user_id, status: @pet.status } }
    end

    assert_redirected_to pet_url(Pet.last)
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_url(@pet)
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { age: @pet.age, description: @pet.description, location_id: @pet.location_id, name: @pet.name, pet_breed_id: @pet.pet_breed_id, user_id: @pet.user_id, status: @pet.status } }
    assert_redirected_to pet_url(@pet)
  end

  test "should destroy pet" do
    @user = build(:admin)
    sign_in @user
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet)
    end

    assert_redirected_to pets_url
  end
end

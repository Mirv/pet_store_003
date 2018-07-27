# require "application_system_test_case"

# class PetCategoriesTest < ApplicationSystemTestCase
#   setup do
#     @pet_category = pet_categories(:one)
#   end

#   test "visiting the index" do
#     visit pet_categories_url
#     assert_selector "h1", text: "Pet Categories"
#   end

#   test "creating a Pet category" do
#     visit pet_categories_url
#     click_on "New Pet Category"

#     fill_in "Description", with: @pet_category.description
#     fill_in "Name", with: @pet_category.name
#     click_on "Create Pet category"

#     assert_text "Pet category was successfully created"
#     click_on "Back"
#   end

#   test "updating a Pet category" do
#     visit pet_categories_url
#     click_on "Edit", match: :first

#     fill_in "Description", with: @pet_category.description
#     fill_in "Name", with: @pet_category.name
#     click_on "Update Pet category"

#     assert_text "Pet category was successfully updated"
#     click_on "Back"
#   end

#   test "destroying a Pet category" do
#     visit pet_categories_url
#     page.accept_confirm do
#       click_on "Destroy", match: :first
#     end

#     assert_text "Pet category was successfully destroyed"
#   end
# end

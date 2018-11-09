require 'ffaker'

# This will guess the User class
FactoryBot.define do
  factory :user do
    email               { FFaker::Internet.email }
    encrypted_password  "ssssss"
    password            "ssssss"
    admin               false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email               { FFaker::Internet.email }
    encrypted_password  "ssssss"
    password            "ssssss"
    admin               true
  end
  
  factory :pet do
    name { FFaker::AnimalUS.common_name }
    description "MyString"
    status { Pet.statuses.values.sample }
    age 9.99
    location 
    pet_breed
    user
  end
  
  factory :location do
    name    { FFaker::Internet.email } # FFaker::Address.city }
    xcoord  1
    ycoord  1
    user
    status { Location.statuses.values.sample }
  end
  
  factory :pet_breed do
    name { FFaker::Food.fruit }
    description "MyString"
    association :pet_category 
  end
  
  factory :pet_category do
    name { FFaker::Food.fruit }
    description "MyString"
  end
end

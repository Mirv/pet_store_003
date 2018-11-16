require 'ffaker'

# This will guess the User class
FactoryBot.define do
  factory :user do
    email               { FFaker::Internet.email }
    encrypted_password  { "ssssss" }
    password            { "ssssss" }
    admin               { false }
  end

  # TODO - implement a trait here
  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email               { FFaker::Internet.email }
    encrypted_password  {"ssssss"}
    password            {"ssssss"}
    admin               {true}
  end
  
  factory :pet do
    name { FFaker::Book.title }
    description { FFaker::BaconIpsum.word }
    status { Pet.statuses.values.sample }
    age {rand(10)}
    location 
    pet_breed
    user
  end
  
  factory :location do
    name    { FFaker::AddressUS.city } 
    xcoord  {1}
    ycoord  {1}
    user
    status { Location.statuses.values.sample }
  end
  
  factory :pet_breed do
    name { FFaker::Food.fruit }
    description { FFaker::BaconIpsum.word }
    association :pet_category 
  end
  
  factory :pet_category do
    name { FFaker::Food.fruit }
    description {"MyString"}
  end
end

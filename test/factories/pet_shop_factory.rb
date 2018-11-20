require 'faker'

# This will guess the User class
FactoryBot.define do
  factory :user do
    email               { Faker::Internet.email }
    encrypted_password  { "ssssss" }
    password            { "ssssss" }
    admin               { false }
  end

  # TODO - implement a trait here
  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email               { Faker::Internet.email }
    encrypted_password  {"ssssss"}
    password            {"ssssss"}
    admin               {true}
  end
  
  factory :pet do
    name { Faker::Cat.name }
    description { Faker::HowIMetYourMother }
    status { Pet.statuses.values.sample }
    age {rand(10)}
    location 
    pet_breed
    user
  end
  
  factory :location do
    name    { Faker::Address.city } 
    xcoord  {1}
    ycoord  {1}
    user
    status { Location.statuses.values.sample }
  end
  
  factory :pet_breed do
    name { Faker::Cat.breed }
    description { Faker::HowIMetYourMother }
    association :pet_category 
  end
  
  factory :pet_category do
    name { Faker::Lorem.word }
    description {"MyString"}
  end
end

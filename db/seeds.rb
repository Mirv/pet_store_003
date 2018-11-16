# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    u = User.create!(email: "z@test.com",password: "ssssss")
    l = Location.create!(name: "z", xcoord: 1, ycoord: 1, user_id: u.id, status: Location.statuses.values.first)
    pc = PetCategory.create!(name: "Standing", description: "It Stands")
    pb = PetBreed.create!(name: "First", description: "Another standing variety", pet_category_id: pc.id)
    Pet.create!(
      name: "FirstPet", 
      description: "First to be pet", 
      age: 1, 
      location_id: l.id, 
      pet_breed_id: pb.id,
      user_id: u.id,
      status: Pet.statuses.values.first
      )
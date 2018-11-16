# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# load our seeds files
puts "Loading db/seeds/*"
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

# count additions
counters = Hash.new
counters['User'] = User.count
counters['Pet'] = Pet.count
counters['Location'] = Location.count
counters['PetBreed'] = PetBreed.count
counters['PetCategory'] = PetCategory.count


def make_set(email = "a@test.com", password = "ssssss")
    u = User.create!(email: "a@test.com",password: "ssssss")
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
end

f = FactoryBot

30.times do
  pet_breed = f.create(:pet_breed)

  user = f.create(:user, email: findDefaultUserEmail) do |user|
    loc = user.location.create(f.attributes_for(:location))
    pet = user.pets.create(
        f.attributes_for(
          :pet,                         # default factory values
          location_id: loc.id,          # over riding a value in hash
          pet_breed_id: pet_breed.id   # over riding a value in hash
        )
      )
  end
end


# 30.times do 
#   f.create(:pet)
# end





puts "Database counts"
counters.each do |key, value|
  puts "#{key} -- Before:  #{value},  After:  #{key.constantize.count}"
end

# SeedObject.create_breed
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Executable for the seeding - can set number of runs via count
def run_process(count = 15)
  # grab counts of target tables
  counters = set_counters

  # load files necessary
  load_all_seeds

  # run the seeding 
  execute_seeds(count)
  
  # diplays old next to AR db call of actual count post seeding
  puts "Database counts"
  post_count(counters)
end

# load our seeds files
def load_all_seeds
  puts "Loading db/seeds/*"
  Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
end

def set_counters
  # count additions
  counters = Hash.new
  counters['User'] = User.count
  counters['Pet'] = Pet.count
  counters['Location'] = Location.count
  counters['PetBreed'] = PetBreed.count
  counters['PetCategory'] = PetCategory.count
  
  return counters
end

def post_count(counters)
  if counters.present?
    # display count from before, then call db to count to confirm it worked
    counters.each do |key, value|
      puts "#{key} -- Before:  #{value},  After:  #{key.constantize.count}"
    end
  end
end

def execute_seeds(count = 15)
  f = FactoryBot
  count.times do
    pet_breed = f.create(:pet_breed)
    user = f.create(:user, email: findDefaultUserEmail) do |user|
      loc = user.location.create(f.attributes_for(:location))
      pet = user.pets.create(
          f.attributes_for(
            :pet,                         # default factory values
            location_id: loc.id,          # over riding a value in hash
            pet_breed_id: pet_breed.id    # over riding a value in hash
          )
        )
    end
  end
end

run_process unless Rails.env.test? 



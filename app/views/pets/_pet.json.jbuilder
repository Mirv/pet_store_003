json.extract! pet, :id, :name, :description, :age, :pet_breed_id, :location_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
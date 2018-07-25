json.extract! pet_breed, :id, :name, :description, :pet_category_id, :created_at, :updated_at
json.url pet_breed_url(pet_breed, format: :json)

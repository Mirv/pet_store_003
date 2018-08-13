class PetBreed < ApplicationRecord
  belongs_to :pet_category
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :pet_category_id
end

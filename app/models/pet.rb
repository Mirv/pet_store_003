class Pet < ApplicationRecord
  belongs_to :pet_breed
  belongs_to :location
end
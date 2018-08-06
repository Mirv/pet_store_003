class Pet < ApplicationRecord
  enum status: {
    draft: 5000, published: 200, sold: 4000, cancelled: 5200,
    billing: 20000, ready_for_fulfillment: 20200, fulfilling_processing: 20400,
    removed: 30000, suspended: 30200, banned: 30400 }, _prefix: :pet
    
  belongs_to :pet_breed
  belongs_to :location
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :age
  validates_presence_of :pet_breed
  validates_presence_of :location_id
  validates_presence_of :user_id
end
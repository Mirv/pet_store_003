class Location < ApplicationRecord
  belongs_to  :user, touch: true
  has_many    :pets
  enum status: {closed: 0, open: 1, shutdown: 2, shutdown_temporarily: 3}, _prefix: :store
  
  validates_presence_of :name
  validates_presence_of :xcoord
  validates_presence_of :ycoord
  validates_presence_of :user_id
  validates_presence_of :status
end

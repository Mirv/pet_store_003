class Pet < ApplicationRecord
  enum status: {
    zero: 0,  # testing status 
    draft: 5000, published: 200, pre_sale: 210, sold: 4000, cancelled: 5200,
    payment_pending: 20000, ready_for_fulfillment: 20200, fulfilling_processing: 20400,
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
  validates_presence_of :status
  
  # allow for different sale types with this range, exlude sold from range
  scope :for_sale, -> { where(status:  (:published)...(:sold)) }  # ... is exclusive end
  scope :admin_off, -> { where(status:  (:removed)..(:banned)) }  # .. is inclusive
  scope :ordering, -> { where(status:  (:payment_pending)..(:fulfilling_processing)) }  # .. is inclusive


end
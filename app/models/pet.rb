class Pet < ApplicationRecord
  enum status: {
    draft: 5000, published: 200, sold: 4000, cancelled: 5200,
    billing: 20000, ready_for_fulfillment: 20200, fulfilling_processing: 20400,
    removed: 30000, suspended: 30200, banned: 30400 }, _prefix: :pet
    
  belongs_to :pet_breed
  belongs_to :location
  belongs_to :user
end


# You can use the :_prefix or :_suffix options when you need to define multiple enums with same values. If the passed value is true, the methods are prefixed/suffixed with the name of the enum. It is also possible to supply a custom value:
# https://api.rubyonrails.org/classes/ActiveRecord/Enum.html
# class Conversation < ActiveRecord::Base
#   enum status: [:active, :archived], _suffix: true
#   enum comments_status: [:active, :inactive], _prefix: :comments
# end
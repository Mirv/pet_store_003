require 'ffaker'
require 'faker'
require 'factory_bot'

class SeedObject
  include FactoryBot::Syntax::Methods

  def self.create_breed
    @pet_breed = create(:pet_breed)
  end

end
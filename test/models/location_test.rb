require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  setup do
    @location = FactoryBot.create(:location)
  end
  
  test "invalid without name" do
    @location.name = ""
    refute @location.valid?
  end
 
  test "invalid without x-coord" do
    @location.xcoord = ""
    refute @location.valid?
  end
 
  test "invalid without y-coord" do
    @location.ycoord = ""
    refute @location.valid?
  end
  
  test "invalid without user_id" do
    @location.user_id = ""
    refute @location.valid?
  end
  
  test "invalid without status" do
    @location.status = nil
    refute @location.valid?
  end
end

#  test default route works
#  test route to user works
#  test a previously created user exists in response
require 'test_helper'
class LocationsControllerTest < ActionDispatch::IntegrationTest

  test "user index should suceed" do
    get api_v1_users_path
    assert_response :success
  end
  
  test "root should suceed" do
    get '/'
    assert_response :success
  end
  
  test "user should be served" do 
    user = FactoryBot.create(:user)

    get api_v1_users_path
    
    # Take served info
    json_response = JSON.parse(@response.body)
    
    # drop all the values into a quick search format
    results = json_response.map{|x| x.values}.flatten
    assert_includes results, user.email
  end
end
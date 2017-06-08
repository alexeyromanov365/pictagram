require 'test_helper'

class PersonControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get person_profile_url
    assert_response :success
  end

end

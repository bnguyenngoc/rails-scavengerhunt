require 'test_helper'

class TeamsRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get teams_relationships_join_url
    assert_response :success
  end

  test "should get leave" do
    get teams_relationships_leave_url
    assert_response :success
  end

end

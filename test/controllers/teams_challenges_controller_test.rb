# frozen_string_literal: true

require 'test_helper'

class TeamsChallengesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get teams_challenges_show_url
    assert_response :success
  end

  test 'should get submit' do
    get teams_challenges_submit_url
    assert_response :success
  end
end

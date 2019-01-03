# frozen_string_literal: true

require 'test_helper'

class NotesControllerControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get notes_controller_create_url
    assert_response :success
  end

  test 'should get update' do
    get notes_controller_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get notes_controller_destroy_url
    assert_response :success
  end
end

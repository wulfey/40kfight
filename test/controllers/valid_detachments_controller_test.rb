require 'test_helper'

class ValidDetachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_detachment = valid_detachments(:one)
  end

  test "should get index" do
    get valid_detachments_url
    assert_response :success
  end

  test "should get new" do
    get new_valid_detachment_url
    assert_response :success
  end

  test "should create valid_detachment" do
    assert_difference('ValidDetachment.count') do
      post valid_detachments_url, params: { valid_detachment: { command_points: @valid_detachment.command_points, dedicated_allowed: @valid_detachment.dedicated_allowed, max_elites: @valid_detachment.max_elites, max_fast: @valid_detachment.max_fast, max_flyer: @valid_detachment.max_flyer, max_heavy: @valid_detachment.max_heavy, max_hq: @valid_detachment.max_hq, max_lord: @valid_detachment.max_lord, max_troops: @valid_detachment.max_troops, min_elites: @valid_detachment.min_elites, min_fast: @valid_detachment.min_fast, min_flyer: @valid_detachment.min_flyer, min_heavy: @valid_detachment.min_heavy, min_hq: @valid_detachment.min_hq, min_lord: @valid_detachment.min_lord, min_troops: @valid_detachment.min_troops, name: @valid_detachment.name } }
    end

    assert_redirected_to valid_detachment_url(ValidDetachment.last)
  end

  test "should show valid_detachment" do
    get valid_detachment_url(@valid_detachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_valid_detachment_url(@valid_detachment)
    assert_response :success
  end

  test "should update valid_detachment" do
    patch valid_detachment_url(@valid_detachment), params: { valid_detachment: { command_points: @valid_detachment.command_points, dedicated_allowed: @valid_detachment.dedicated_allowed, max_elites: @valid_detachment.max_elites, max_fast: @valid_detachment.max_fast, max_flyer: @valid_detachment.max_flyer, max_heavy: @valid_detachment.max_heavy, max_hq: @valid_detachment.max_hq, max_lord: @valid_detachment.max_lord, max_troops: @valid_detachment.max_troops, min_elites: @valid_detachment.min_elites, min_fast: @valid_detachment.min_fast, min_flyer: @valid_detachment.min_flyer, min_heavy: @valid_detachment.min_heavy, min_hq: @valid_detachment.min_hq, min_lord: @valid_detachment.min_lord, min_troops: @valid_detachment.min_troops, name: @valid_detachment.name } }
    assert_redirected_to valid_detachment_url(@valid_detachment)
  end

  test "should destroy valid_detachment" do
    assert_difference('ValidDetachment.count', -1) do
      delete valid_detachment_url(@valid_detachment)
    end

    assert_redirected_to valid_detachments_url
  end
end

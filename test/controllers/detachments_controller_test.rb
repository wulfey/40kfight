require 'test_helper'

class DetachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detachment = detachments(:one)
  end

  test "should get index" do
    get detachments_url
    assert_response :success
  end

  test "should get new" do
    get new_detachment_url
    assert_response :success
  end

  test "should create detachment" do
    assert_difference('Detachment.count') do
      post detachments_url, params: { detachment: { command_points: @detachment.command_points, dedicated_allowed: @detachment.dedicated_allowed, list_id: @detachment.list_id, max_elites: @detachment.max_elites, max_fast: @detachment.max_fast, max_flyer: @detachment.max_flyer, max_heavy: @detachment.max_heavy, max_hq: @detachment.max_hq, max_lord: @detachment.max_lord, max_troops: @detachment.max_troops, min_elites: @detachment.min_elites, min_fast: @detachment.min_fast, min_flyer: @detachment.min_flyer, min_heavy: @detachment.min_heavy, min_hq: @detachment.min_hq, min_lord: @detachment.min_lord, min_troops: @detachment.min_troops, name: @detachment.name } }
    end

    assert_redirected_to detachment_url(Detachment.last)
  end

  test "should show detachment" do
    get detachment_url(@detachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_detachment_url(@detachment)
    assert_response :success
  end

  test "should update detachment" do
    patch detachment_url(@detachment), params: { detachment: { command_points: @detachment.command_points, dedicated_allowed: @detachment.dedicated_allowed, list_id: @detachment.list_id, max_elites: @detachment.max_elites, max_fast: @detachment.max_fast, max_flyer: @detachment.max_flyer, max_heavy: @detachment.max_heavy, max_hq: @detachment.max_hq, max_lord: @detachment.max_lord, max_troops: @detachment.max_troops, min_elites: @detachment.min_elites, min_fast: @detachment.min_fast, min_flyer: @detachment.min_flyer, min_heavy: @detachment.min_heavy, min_hq: @detachment.min_hq, min_lord: @detachment.min_lord, min_troops: @detachment.min_troops, name: @detachment.name } }
    assert_redirected_to detachment_url(@detachment)
  end

  test "should destroy detachment" do
    assert_difference('Detachment.count', -1) do
      delete detachment_url(@detachment)
    end

    assert_redirected_to detachments_url
  end
end

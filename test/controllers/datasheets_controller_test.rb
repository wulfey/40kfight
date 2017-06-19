require 'test_helper'

class DatasheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datasheet = datasheets(:one)
  end

  test "should get index" do
    get datasheets_url
    assert_response :success
  end

  test "should get new" do
    get new_datasheet_url
    assert_response :success
  end

  test "should create datasheet" do
    assert_difference('Datasheet.count') do
      post datasheets_url, params: { datasheet: { armor_save: @datasheet.armor_save, attacks: @datasheet.attacks, combat_skill: @datasheet.combat_skill, first_slot: @datasheet.first_slot, fourth_slot: @datasheet.fourth_slot, invul_combat: @datasheet.invul_combat, invul_shooting: @datasheet.invul_shooting, leadership: @datasheet.leadership, max_model_count: @datasheet.max_model_count, min_model_count: @datasheet.min_model_count, model_count_increment: @datasheet.model_count_increment, movement: @datasheet.movement, name: @datasheet.name, power: @datasheet.power, power_for_each_increment: @datasheet.power_for_each_increment, role: @datasheet.role, second_slot: @datasheet.second_slot, shooting_skill: @datasheet.shooting_skill, single_model_point_cost: @datasheet.single_model_point_cost, strength: @datasheet.strength, third_slot: @datasheet.third_slot, wounds: @datasheet.wounds } }
    end

    assert_redirected_to datasheet_url(Datasheet.last)
  end

  test "should show datasheet" do
    get datasheet_url(@datasheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_datasheet_url(@datasheet)
    assert_response :success
  end

  test "should update datasheet" do
    patch datasheet_url(@datasheet), params: { datasheet: { armor_save: @datasheet.armor_save, attacks: @datasheet.attacks, combat_skill: @datasheet.combat_skill, first_slot: @datasheet.first_slot, fourth_slot: @datasheet.fourth_slot, invul_combat: @datasheet.invul_combat, invul_shooting: @datasheet.invul_shooting, leadership: @datasheet.leadership, max_model_count: @datasheet.max_model_count, min_model_count: @datasheet.min_model_count, model_count_increment: @datasheet.model_count_increment, movement: @datasheet.movement, name: @datasheet.name, power: @datasheet.power, power_for_each_increment: @datasheet.power_for_each_increment, role: @datasheet.role, second_slot: @datasheet.second_slot, shooting_skill: @datasheet.shooting_skill, single_model_point_cost: @datasheet.single_model_point_cost, strength: @datasheet.strength, third_slot: @datasheet.third_slot, wounds: @datasheet.wounds } }
    assert_redirected_to datasheet_url(@datasheet)
  end

  test "should destroy datasheet" do
    assert_difference('Datasheet.count', -1) do
      delete datasheet_url(@datasheet)
    end

    assert_redirected_to datasheets_url
  end
end

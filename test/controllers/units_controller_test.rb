require 'test_helper'

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get units_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_url
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post units_url, params: { unit: { armor_save: @unit.armor_save, attacks: @unit.attacks, combat_skill: @unit.combat_skill, detachment_id: @unit.detachment_id, invul_combat: @unit.invul_combat, invul_shooting: @unit.invul_shooting, leadership: @unit.leadership, max_model_count: @unit.max_model_count, min_model_count: @unit.min_model_count, model_count_increment: @unit.model_count_increment, movemovent: @unit.movemovent, name: @unit.name, power: @unit.power, power_for_each_increment: @unit.power_for_each_increment, role: @unit.role, shooting_skill: @unit.shooting_skill, single_model_point_cost: @unit.single_model_point_cost, strength: @unit.strength, wounds: @unit.wounds } }
    end

    assert_redirected_to unit_url(Unit.last)
  end

  test "should show unit" do
    get unit_url(@unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_url(@unit)
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { armor_save: @unit.armor_save, attacks: @unit.attacks, combat_skill: @unit.combat_skill, detachment_id: @unit.detachment_id, invul_combat: @unit.invul_combat, invul_shooting: @unit.invul_shooting, leadership: @unit.leadership, max_model_count: @unit.max_model_count, min_model_count: @unit.min_model_count, model_count_increment: @unit.model_count_increment, movemovent: @unit.movemovent, name: @unit.name, power: @unit.power, power_for_each_increment: @unit.power_for_each_increment, role: @unit.role, shooting_skill: @unit.shooting_skill, single_model_point_cost: @unit.single_model_point_cost, strength: @unit.strength, wounds: @unit.wounds } }
    assert_redirected_to unit_url(@unit)
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete unit_url(@unit)
    end

    assert_redirected_to units_url
  end
end

require 'test_helper'

class SecondWeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @second_weapon = second_weapons(:one)
  end

  test "should get index" do
    get second_weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_second_weapon_url
    assert_response :success
  end

  test "should create second_weapon" do
    assert_difference('SecondWeapon.count') do
      post second_weapons_url, params: { second_weapon: { firstRange: @second_weapon.firstRange, firstShootAttacks: @second_weapon.firstShootAttacks, firstShootAttacks: @second_weapon.firstShootAttacks, firstShootAttacksD3: @second_weapon.firstShootAttacksD3, firstShootAttacksD6: @second_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @second_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @second_weapon.firstShootAttacksDamageD6, fourthRange: @second_weapon.fourthRange, fourthShootAttacks: @second_weapon.fourthShootAttacks, fourthShootAttacks: @second_weapon.fourthShootAttacks, melee: @second_weapon.melee, points: @second_weapon.points, primaryAddedMeleeStr: @second_weapon.primaryAddedMeleeStr, primaryMeleeRend: @second_weapon.primaryMeleeRend, ranged: @second_weapon.ranged, secondRange: @second_weapon.secondRange, secondShootAttacks: @second_weapon.secondShootAttacks, secondShootAttacks: @second_weapon.secondShootAttacks, secondShootAttacksD3: @second_weapon.secondShootAttacksD3, secondShootAttacksD6: @second_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @second_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @second_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @second_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @second_weapon.secondaryMeleeRend, thirdRange: @second_weapon.thirdRange, thirdShootAttacks: @second_weapon.thirdShootAttacks, thirdShootAttacks: @second_weapon.thirdShootAttacks } }
    end

    assert_redirected_to second_weapon_url(SecondWeapon.last)
  end

  test "should show second_weapon" do
    get second_weapon_url(@second_weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_second_weapon_url(@second_weapon)
    assert_response :success
  end

  test "should update second_weapon" do
    patch second_weapon_url(@second_weapon), params: { second_weapon: { firstRange: @second_weapon.firstRange, firstShootAttacks: @second_weapon.firstShootAttacks, firstShootAttacks: @second_weapon.firstShootAttacks, firstShootAttacksD3: @second_weapon.firstShootAttacksD3, firstShootAttacksD6: @second_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @second_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @second_weapon.firstShootAttacksDamageD6, fourthRange: @second_weapon.fourthRange, fourthShootAttacks: @second_weapon.fourthShootAttacks, fourthShootAttacks: @second_weapon.fourthShootAttacks, melee: @second_weapon.melee, points: @second_weapon.points, primaryAddedMeleeStr: @second_weapon.primaryAddedMeleeStr, primaryMeleeRend: @second_weapon.primaryMeleeRend, ranged: @second_weapon.ranged, secondRange: @second_weapon.secondRange, secondShootAttacks: @second_weapon.secondShootAttacks, secondShootAttacks: @second_weapon.secondShootAttacks, secondShootAttacksD3: @second_weapon.secondShootAttacksD3, secondShootAttacksD6: @second_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @second_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @second_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @second_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @second_weapon.secondaryMeleeRend, thirdRange: @second_weapon.thirdRange, thirdShootAttacks: @second_weapon.thirdShootAttacks, thirdShootAttacks: @second_weapon.thirdShootAttacks } }
    assert_redirected_to second_weapon_url(@second_weapon)
  end

  test "should destroy second_weapon" do
    assert_difference('SecondWeapon.count', -1) do
      delete second_weapon_url(@second_weapon)
    end

    assert_redirected_to second_weapons_url
  end
end

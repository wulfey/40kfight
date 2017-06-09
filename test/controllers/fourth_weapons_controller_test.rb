require 'test_helper'

class FourthWeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fourth_weapon = fourth_weapons(:one)
  end

  test "should get index" do
    get fourth_weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_fourth_weapon_url
    assert_response :success
  end

  test "should create fourth_weapon" do
    assert_difference('FourthWeapon.count') do
      post fourth_weapons_url, params: { fourth_weapon: { firstRange: @fourth_weapon.firstRange, firstShootAttacks: @fourth_weapon.firstShootAttacks, firstShootAttacks: @fourth_weapon.firstShootAttacks, firstShootAttacksD3: @fourth_weapon.firstShootAttacksD3, firstShootAttacksD6: @fourth_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @fourth_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @fourth_weapon.firstShootAttacksDamageD6, fourthRange: @fourth_weapon.fourthRange, fourthShootAttacks: @fourth_weapon.fourthShootAttacks, fourthShootAttacks: @fourth_weapon.fourthShootAttacks, melee: @fourth_weapon.melee, points: @fourth_weapon.points, primaryAddedMeleeStr: @fourth_weapon.primaryAddedMeleeStr, primaryMeleeRend: @fourth_weapon.primaryMeleeRend, ranged: @fourth_weapon.ranged, secondRange: @fourth_weapon.secondRange, secondShootAttacks: @fourth_weapon.secondShootAttacks, secondShootAttacks: @fourth_weapon.secondShootAttacks, secondShootAttacksD3: @fourth_weapon.secondShootAttacksD3, secondShootAttacksD6: @fourth_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @fourth_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @fourth_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @fourth_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @fourth_weapon.secondaryMeleeRend, thirdRange: @fourth_weapon.thirdRange, thirdShootAttacks: @fourth_weapon.thirdShootAttacks, thirdShootAttacks: @fourth_weapon.thirdShootAttacks } }
    end

    assert_redirected_to fourth_weapon_url(FourthWeapon.last)
  end

  test "should show fourth_weapon" do
    get fourth_weapon_url(@fourth_weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_fourth_weapon_url(@fourth_weapon)
    assert_response :success
  end

  test "should update fourth_weapon" do
    patch fourth_weapon_url(@fourth_weapon), params: { fourth_weapon: { firstRange: @fourth_weapon.firstRange, firstShootAttacks: @fourth_weapon.firstShootAttacks, firstShootAttacks: @fourth_weapon.firstShootAttacks, firstShootAttacksD3: @fourth_weapon.firstShootAttacksD3, firstShootAttacksD6: @fourth_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @fourth_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @fourth_weapon.firstShootAttacksDamageD6, fourthRange: @fourth_weapon.fourthRange, fourthShootAttacks: @fourth_weapon.fourthShootAttacks, fourthShootAttacks: @fourth_weapon.fourthShootAttacks, melee: @fourth_weapon.melee, points: @fourth_weapon.points, primaryAddedMeleeStr: @fourth_weapon.primaryAddedMeleeStr, primaryMeleeRend: @fourth_weapon.primaryMeleeRend, ranged: @fourth_weapon.ranged, secondRange: @fourth_weapon.secondRange, secondShootAttacks: @fourth_weapon.secondShootAttacks, secondShootAttacks: @fourth_weapon.secondShootAttacks, secondShootAttacksD3: @fourth_weapon.secondShootAttacksD3, secondShootAttacksD6: @fourth_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @fourth_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @fourth_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @fourth_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @fourth_weapon.secondaryMeleeRend, thirdRange: @fourth_weapon.thirdRange, thirdShootAttacks: @fourth_weapon.thirdShootAttacks, thirdShootAttacks: @fourth_weapon.thirdShootAttacks } }
    assert_redirected_to fourth_weapon_url(@fourth_weapon)
  end

  test "should destroy fourth_weapon" do
    assert_difference('FourthWeapon.count', -1) do
      delete fourth_weapon_url(@fourth_weapon)
    end

    assert_redirected_to fourth_weapons_url
  end
end

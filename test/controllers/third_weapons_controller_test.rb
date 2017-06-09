require 'test_helper'

class ThirdWeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @third_weapon = third_weapons(:one)
  end

  test "should get index" do
    get third_weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_third_weapon_url
    assert_response :success
  end

  test "should create third_weapon" do
    assert_difference('ThirdWeapon.count') do
      post third_weapons_url, params: { third_weapon: { firstRange: @third_weapon.firstRange, firstShootAttacks: @third_weapon.firstShootAttacks, firstShootAttacks: @third_weapon.firstShootAttacks, firstShootAttacksD3: @third_weapon.firstShootAttacksD3, firstShootAttacksD6: @third_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @third_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @third_weapon.firstShootAttacksDamageD6, fourthRange: @third_weapon.fourthRange, fourthShootAttacks: @third_weapon.fourthShootAttacks, fourthShootAttacks: @third_weapon.fourthShootAttacks, melee: @third_weapon.melee, points: @third_weapon.points, primaryAddedMeleeStr: @third_weapon.primaryAddedMeleeStr, primaryMeleeRend: @third_weapon.primaryMeleeRend, ranged: @third_weapon.ranged, secondRange: @third_weapon.secondRange, secondShootAttacks: @third_weapon.secondShootAttacks, secondShootAttacks: @third_weapon.secondShootAttacks, secondShootAttacksD3: @third_weapon.secondShootAttacksD3, secondShootAttacksD6: @third_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @third_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @third_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @third_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @third_weapon.secondaryMeleeRend, thirdRange: @third_weapon.thirdRange, thirdShootAttacks: @third_weapon.thirdShootAttacks, thirdShootAttacks: @third_weapon.thirdShootAttacks } }
    end

    assert_redirected_to third_weapon_url(ThirdWeapon.last)
  end

  test "should show third_weapon" do
    get third_weapon_url(@third_weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_third_weapon_url(@third_weapon)
    assert_response :success
  end

  test "should update third_weapon" do
    patch third_weapon_url(@third_weapon), params: { third_weapon: { firstRange: @third_weapon.firstRange, firstShootAttacks: @third_weapon.firstShootAttacks, firstShootAttacks: @third_weapon.firstShootAttacks, firstShootAttacksD3: @third_weapon.firstShootAttacksD3, firstShootAttacksD6: @third_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @third_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @third_weapon.firstShootAttacksDamageD6, fourthRange: @third_weapon.fourthRange, fourthShootAttacks: @third_weapon.fourthShootAttacks, fourthShootAttacks: @third_weapon.fourthShootAttacks, melee: @third_weapon.melee, points: @third_weapon.points, primaryAddedMeleeStr: @third_weapon.primaryAddedMeleeStr, primaryMeleeRend: @third_weapon.primaryMeleeRend, ranged: @third_weapon.ranged, secondRange: @third_weapon.secondRange, secondShootAttacks: @third_weapon.secondShootAttacks, secondShootAttacks: @third_weapon.secondShootAttacks, secondShootAttacksD3: @third_weapon.secondShootAttacksD3, secondShootAttacksD6: @third_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @third_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @third_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @third_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @third_weapon.secondaryMeleeRend, thirdRange: @third_weapon.thirdRange, thirdShootAttacks: @third_weapon.thirdShootAttacks, thirdShootAttacks: @third_weapon.thirdShootAttacks } }
    assert_redirected_to third_weapon_url(@third_weapon)
  end

  test "should destroy third_weapon" do
    assert_difference('ThirdWeapon.count', -1) do
      delete third_weapon_url(@third_weapon)
    end

    assert_redirected_to third_weapons_url
  end
end

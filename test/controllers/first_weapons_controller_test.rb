require 'test_helper'

class FirstWeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_weapon = first_weapons(:one)
  end

  test "should get index" do
    get first_weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_first_weapon_url
    assert_response :success
  end

  test "should create first_weapon" do
    assert_difference('FirstWeapon.count') do
      post first_weapons_url, params: { first_weapon: { firstRange: @first_weapon.firstRange, firstShootAttacks: @first_weapon.firstShootAttacks, firstShootAttacks: @first_weapon.firstShootAttacks, firstShootAttacksD3: @first_weapon.firstShootAttacksD3, firstShootAttacksD6: @first_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @first_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @first_weapon.firstShootAttacksDamageD6, fourthRange: @first_weapon.fourthRange, fourthShootAttacks: @first_weapon.fourthShootAttacks, fourthShootAttacks: @first_weapon.fourthShootAttacks, melee: @first_weapon.melee, points: @first_weapon.points, primaryAddedMeleeStr: @first_weapon.primaryAddedMeleeStr, primaryMeleeRend: @first_weapon.primaryMeleeRend, ranged: @first_weapon.ranged, secondRange: @first_weapon.secondRange, secondShootAttacks: @first_weapon.secondShootAttacks, secondShootAttacks: @first_weapon.secondShootAttacks, secondShootAttacksD3: @first_weapon.secondShootAttacksD3, secondShootAttacksD6: @first_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @first_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @first_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @first_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @first_weapon.secondaryMeleeRend, thirdRange: @first_weapon.thirdRange, thirdShootAttacks: @first_weapon.thirdShootAttacks, thirdShootAttacks: @first_weapon.thirdShootAttacks } }
    end

    assert_redirected_to first_weapon_url(FirstWeapon.last)
  end

  test "should show first_weapon" do
    get first_weapon_url(@first_weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_weapon_url(@first_weapon)
    assert_response :success
  end

  test "should update first_weapon" do
    patch first_weapon_url(@first_weapon), params: { first_weapon: { firstRange: @first_weapon.firstRange, firstShootAttacks: @first_weapon.firstShootAttacks, firstShootAttacks: @first_weapon.firstShootAttacks, firstShootAttacksD3: @first_weapon.firstShootAttacksD3, firstShootAttacksD6: @first_weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @first_weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @first_weapon.firstShootAttacksDamageD6, fourthRange: @first_weapon.fourthRange, fourthShootAttacks: @first_weapon.fourthShootAttacks, fourthShootAttacks: @first_weapon.fourthShootAttacks, melee: @first_weapon.melee, points: @first_weapon.points, primaryAddedMeleeStr: @first_weapon.primaryAddedMeleeStr, primaryMeleeRend: @first_weapon.primaryMeleeRend, ranged: @first_weapon.ranged, secondRange: @first_weapon.secondRange, secondShootAttacks: @first_weapon.secondShootAttacks, secondShootAttacks: @first_weapon.secondShootAttacks, secondShootAttacksD3: @first_weapon.secondShootAttacksD3, secondShootAttacksD6: @first_weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @first_weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @first_weapon.secondShootAttacksDamageD6, secondaryAddedMeleeStr: @first_weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @first_weapon.secondaryMeleeRend, thirdRange: @first_weapon.thirdRange, thirdShootAttacks: @first_weapon.thirdShootAttacks, thirdShootAttacks: @first_weapon.thirdShootAttacks } }
    assert_redirected_to first_weapon_url(@first_weapon)
  end

  test "should destroy first_weapon" do
    assert_difference('FirstWeapon.count', -1) do
      delete first_weapon_url(@first_weapon)
    end

    assert_redirected_to first_weapons_url
  end
end

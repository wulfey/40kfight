require 'test_helper'

class WeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weapon = weapons(:one)
  end

  test "should get index" do
    get weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_weapon_url
    assert_response :success
  end

  test "should create weapon" do
    assert_difference('Weapon.count') do
      post weapons_url, params: { weapon: { datasheet_name: @weapon.datasheet_name, firstRange: @weapon.firstRange, firstShootAttacks: @weapon.firstShootAttacks, firstShootAttacksD3: @weapon.firstShootAttacksD3, firstShootAttacksD6: @weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @weapon.firstShootAttacksDamageD6, firstShootDamage: @weapon.firstShootDamage, firstShootRend: @weapon.firstShootRend, firstShootStrength: @weapon.firstShootStrength, fourthRange: @weapon.fourthRange, fourthShootAttacks: @weapon.fourthShootAttacks, fourthShootDamage: @weapon.fourthShootDamage, fourthShootRend: @weapon.fourthShootRend, fourthShootStrength: @weapon.fourthShootStrength, melee: @weapon.melee, name: @weapon.name, points: @weapon.points, primaryAddedMeleeStr: @weapon.primaryAddedMeleeStr, primaryMeleeRend: @weapon.primaryMeleeRend, ranged: @weapon.ranged, secondRange: @weapon.secondRange, secondShootAttacks: @weapon.secondShootAttacks, secondShootAttacksD3: @weapon.secondShootAttacksD3, secondShootAttacksD6: @weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @weapon.secondShootAttacksDamageD6, secondShootDamage: @weapon.secondShootDamage, secondShootRend: @weapon.secondShootRend, secondShootStrength: @weapon.secondShootStrength, secondaryAddedMeleeStr: @weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @weapon.secondaryMeleeRend, slot: @weapon.slot, thirdRange: @weapon.thirdRange, thirdShootAttacks: @weapon.thirdShootAttacks, thirdShootDamage: @weapon.thirdShootDamage, thirdShootRend: @weapon.thirdShootRend, thirdShootStrength: @weapon.thirdShootStrength } }
    end

    assert_redirected_to weapon_url(Weapon.last)
  end

  test "should show weapon" do
    get weapon_url(@weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_weapon_url(@weapon)
    assert_response :success
  end

  test "should update weapon" do
    patch weapon_url(@weapon), params: { weapon: { datasheet_name: @weapon.datasheet_name, firstRange: @weapon.firstRange, firstShootAttacks: @weapon.firstShootAttacks, firstShootAttacksD3: @weapon.firstShootAttacksD3, firstShootAttacksD6: @weapon.firstShootAttacksD6, firstShootAttacksDamageD3: @weapon.firstShootAttacksDamageD3, firstShootAttacksDamageD6: @weapon.firstShootAttacksDamageD6, firstShootDamage: @weapon.firstShootDamage, firstShootRend: @weapon.firstShootRend, firstShootStrength: @weapon.firstShootStrength, fourthRange: @weapon.fourthRange, fourthShootAttacks: @weapon.fourthShootAttacks, fourthShootDamage: @weapon.fourthShootDamage, fourthShootRend: @weapon.fourthShootRend, fourthShootStrength: @weapon.fourthShootStrength, melee: @weapon.melee, name: @weapon.name, points: @weapon.points, primaryAddedMeleeStr: @weapon.primaryAddedMeleeStr, primaryMeleeRend: @weapon.primaryMeleeRend, ranged: @weapon.ranged, secondRange: @weapon.secondRange, secondShootAttacks: @weapon.secondShootAttacks, secondShootAttacksD3: @weapon.secondShootAttacksD3, secondShootAttacksD6: @weapon.secondShootAttacksD6, secondShootAttacksDamageD3: @weapon.secondShootAttacksDamageD3, secondShootAttacksDamageD6: @weapon.secondShootAttacksDamageD6, secondShootDamage: @weapon.secondShootDamage, secondShootRend: @weapon.secondShootRend, secondShootStrength: @weapon.secondShootStrength, secondaryAddedMeleeStr: @weapon.secondaryAddedMeleeStr, secondaryMeleeRend: @weapon.secondaryMeleeRend, slot: @weapon.slot, thirdRange: @weapon.thirdRange, thirdShootAttacks: @weapon.thirdShootAttacks, thirdShootDamage: @weapon.thirdShootDamage, thirdShootRend: @weapon.thirdShootRend, thirdShootStrength: @weapon.thirdShootStrength } }
    assert_redirected_to weapon_url(@weapon)
  end

  test "should destroy weapon" do
    assert_difference('Weapon.count', -1) do
      delete weapon_url(@weapon)
    end

    assert_redirected_to weapons_url
  end
end

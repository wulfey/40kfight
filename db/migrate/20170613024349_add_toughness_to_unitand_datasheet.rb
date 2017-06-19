class AddToughnessToUnitandDatasheet < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :toughness, :integer, :default => 4
    add_column :datasheets, :toughness, :integer, :default => 4

    change_column_default :first_weapons, :ranged, true
    change_column_default :first_weapons, :melee, false
    change_column_default :first_weapons, :primaryAddedMeleeStr, 0
    change_column_default :first_weapons, :secondaryAddedMeleeStr, 0
    change_column_default :first_weapons, :primaryMeleeRend, 0
    change_column_default :first_weapons, :secondaryMeleeRend, 0
    change_column_default :first_weapons, :firstShootAttacks, 0
    change_column_default :first_weapons, :firstShootAttacksD3, false
    change_column_default :first_weapons, :firstShootAttacksD6, false
    change_column_default :first_weapons, :secondShootAttacks, 0
    change_column_default :first_weapons, :secondShootAttacksD3, false
    change_column_default :first_weapons, :secondShootAttacksD6, false
    change_column_default :first_weapons, :thirdShootAttacks, 0
    change_column_default :first_weapons, :fourthShootAttacks, 0
    change_column_default :first_weapons, :firstShootAttacksDamageD3, false
    change_column_default :first_weapons, :firstShootAttacksDamageD6, false
    change_column_default :first_weapons, :secondShootAttacksDamageD3, false
    change_column_default :first_weapons, :secondShootAttacksDamageD6, false
    change_column_default :first_weapons, :firstShootDamage, 0
    change_column_default :first_weapons, :secondShootDamage, 0
    change_column_default :first_weapons, :thirdShootDamage, 0
    change_column_default :first_weapons, :fourthShootDamage, 0

    change_column_default :second_weapons, :ranged, true
    change_column_default :second_weapons, :melee, false
    change_column_default :second_weapons, :primaryAddedMeleeStr, 0
    change_column_default :second_weapons, :secondaryAddedMeleeStr, 0
    change_column_default :second_weapons, :primaryMeleeRend, 0
    change_column_default :second_weapons, :secondaryMeleeRend, 0
    change_column_default :second_weapons, :firstShootAttacks, 0
    change_column_default :second_weapons, :firstShootAttacksD3, false
    change_column_default :second_weapons, :firstShootAttacksD6, false
    change_column_default :second_weapons, :secondShootAttacks, 0
    change_column_default :second_weapons, :secondShootAttacksD3, false
    change_column_default :second_weapons, :secondShootAttacksD6, false
    change_column_default :second_weapons, :thirdShootAttacks, 0
    change_column_default :second_weapons, :fourthShootAttacks, 0
    change_column_default :second_weapons, :firstShootAttacksDamageD3, false
    change_column_default :second_weapons, :firstShootAttacksDamageD6, false
    change_column_default :second_weapons, :secondShootAttacksDamageD3, false
    change_column_default :second_weapons, :secondShootAttacksDamageD6, false
    change_column_default :second_weapons, :firstShootDamage, 0
    change_column_default :second_weapons, :secondShootDamage, 0
    change_column_default :second_weapons, :thirdShootDamage, 0
    change_column_default :second_weapons, :fourthShootDamage, 0

    change_column_default :third_weapons, :ranged, true
    change_column_default :third_weapons, :melee, false
    change_column_default :third_weapons, :primaryAddedMeleeStr, 0
    change_column_default :third_weapons, :secondaryAddedMeleeStr, 0
    change_column_default :third_weapons, :primaryMeleeRend, 0
    change_column_default :third_weapons, :secondaryMeleeRend, 0
    change_column_default :third_weapons, :firstShootAttacks, 0
    change_column_default :third_weapons, :firstShootAttacksD3, false
    change_column_default :third_weapons, :firstShootAttacksD6, false
    change_column_default :third_weapons, :secondShootAttacks, 0
    change_column_default :third_weapons, :secondShootAttacksD3, false
    change_column_default :third_weapons, :secondShootAttacksD6, false
    change_column_default :third_weapons, :thirdShootAttacks, 0
    change_column_default :third_weapons, :fourthShootAttacks, 0
    change_column_default :third_weapons, :firstShootAttacksDamageD3, false
    change_column_default :third_weapons, :firstShootAttacksDamageD6, false
    change_column_default :third_weapons, :secondShootAttacksDamageD3, false
    change_column_default :third_weapons, :secondShootAttacksDamageD6, false
    change_column_default :third_weapons, :firstShootDamage, 0
    change_column_default :third_weapons, :secondShootDamage, 0
    change_column_default :third_weapons, :thirdShootDamage, 0
    change_column_default :third_weapons, :fourthShootDamage, 0

    change_column_default :fourth_weapons, :ranged, true
    change_column_default :fourth_weapons, :melee, false
    change_column_default :fourth_weapons, :primaryAddedMeleeStr, 0
    change_column_default :fourth_weapons, :secondaryAddedMeleeStr, 0
    change_column_default :fourth_weapons, :primaryMeleeRend, 0
    change_column_default :fourth_weapons, :secondaryMeleeRend, 0
    change_column_default :fourth_weapons, :firstShootAttacks, 0
    change_column_default :fourth_weapons, :firstShootAttacksD3, false
    change_column_default :fourth_weapons, :firstShootAttacksD6, false
    change_column_default :fourth_weapons, :secondShootAttacks, 0
    change_column_default :fourth_weapons, :secondShootAttacksD3, false
    change_column_default :fourth_weapons, :secondShootAttacksD6, false
    change_column_default :fourth_weapons, :thirdShootAttacks, 0
    change_column_default :fourth_weapons, :fourthShootAttacks, 0
    change_column_default :fourth_weapons, :firstShootAttacksDamageD3, false
    change_column_default :fourth_weapons, :firstShootAttacksDamageD6, false
    change_column_default :fourth_weapons, :secondShootAttacksDamageD3, false
    change_column_default :fourth_weapons, :secondShootAttacksDamageD6, false
    change_column_default :fourth_weapons, :firstShootDamage, 0
    change_column_default :fourth_weapons, :secondShootDamage, 0
    change_column_default :fourth_weapons, :thirdShootDamage, 0
    change_column_default :fourth_weapons, :fourthShootDamage, 0

    change_column_default :datasheets, :first_slot, true
    change_column_default :datasheets, :second_slot, false
    change_column_default :datasheets, :third_slot, false
    change_column_default :datasheets, :fourth_slot, false


  end
end

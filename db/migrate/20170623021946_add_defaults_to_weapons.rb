class AddDefaultsToWeapons < ActiveRecord::Migration[5.0]
  def change
    change_column_default :weapons, :ranged, true
    change_column_default :weapons, :melee, false
    change_column_default :weapons, :primaryAddedMeleeStr, 0
    change_column_default :weapons, :secondaryAddedMeleeStr, 0
    change_column_default :weapons, :primaryMeleeRend, 0
    change_column_default :weapons, :secondaryMeleeRend, 0
    change_column_default :weapons, :firstShootAttacks, 1
    change_column_default :weapons, :firstShootAttacksD3, false
    change_column_default :weapons, :firstShootAttacksD6, false
    change_column_default :weapons, :secondShootAttacks, 0
    change_column_default :weapons, :secondShootAttacksD3, false
    change_column_default :weapons, :secondShootAttacksD6, false
    change_column_default :weapons, :thirdShootAttacks, 0
    change_column_default :weapons, :fourthShootAttacks, 0
    change_column_default :weapons, :firstShootAttacksDamageD3, false
    change_column_default :weapons, :firstShootAttacksDamageD6, false
    change_column_default :weapons, :secondShootAttacksDamageD3, false
    change_column_default :weapons, :secondShootAttacksDamageD6, false
    change_column_default :weapons, :firstShootDamage, 1
    change_column_default :weapons, :secondShootDamage, 0
    change_column_default :weapons, :thirdShootDamage, 0
    change_column_default :weapons, :fourthShootDamage, 0
    change_column_default :weapons, :fourthShootDamage, 0


    add_column :weapons, :abilities, :text, array:true, default: []
  end
end

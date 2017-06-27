class CreateWeapons < ActiveRecord::Migration[5.0]
  def change




    create_table :weapons do |t|
        t.string :datasheet_name
        t.string :name
        t.integer :slot
        t.boolean :ranged
        t.boolean :melee
        t.integer :primaryAddedMeleeStr
        t.integer :secondaryAddedMeleeStr
        t.integer :primaryMeleeRend
        t.integer :secondaryMeleeRend
        t.integer :firstShootAttacks
        t.boolean :firstShootAttacksD3
        t.boolean :firstShootAttacksD6
        t.integer :secondShootAttacks
        t.boolean :secondShootAttacksD3
        t.boolean :secondShootAttacksD6
        t.integer :thirdShootAttacks
        t.integer :fourthShootAttacks
        t.integer :firstRange
        t.integer :secondRange
        t.integer :thirdRange
        t.integer :fourthRange
        t.boolean :firstShootAttacksDamageD3
        t.boolean :firstShootAttacksDamageD6
        t.boolean :secondShootAttacksDamageD3
        t.boolean :secondShootAttacksDamageD6
        t.integer :points
        t.integer :firstShootDamage
        t.integer :secondShootDamage
        t.integer :thirdShootDamage
        t.integer :fourthShootDamage
        t.integer :firstShootRend
        t.integer :secondShootRend
        t.integer :thirdShootRend
        t.integer :fourthShootRend
        t.integer :firstShootStrength
        t.integer :secondShootStrength
        t.integer :thirdShootStrength
        t.integer :fourthShootStrength
        t.text :weapon_type
        t.timestamps
    end


  end
end

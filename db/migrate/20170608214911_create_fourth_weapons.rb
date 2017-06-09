class CreateFourthWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :fourth_weapons do |t|
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
      t.integer :firstShootAttacks
      t.integer :secondShootAttacks
      t.integer :thirdShootAttacks
      t.integer :fourthShootAttacks
      t.boolean :firstShootAttacksDamageD3
      t.boolean :firstShootAttacksDamageD6
      t.boolean :secondShootAttacksDamageD3
      t.boolean :secondShootAttacksDamageD6
      t.integer :points

      t.timestamps
    end
  end
end

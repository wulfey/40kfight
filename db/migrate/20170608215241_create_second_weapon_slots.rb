class CreateSecondWeaponSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :second_weapon_slots do |t|
      t.integer :datasheet_id
      t.integer :second_weapon_id
      t.references :datasheet, foreign_key: true
      t.references :second_weapon, foreign_key: true

      t.timestamps
    end
  end
end

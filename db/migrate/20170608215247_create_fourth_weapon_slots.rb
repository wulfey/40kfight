class CreateFourthWeaponSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :fourth_weapon_slots do |t|
      t.integer :datasheet_id
      t.integer :fourth_weapon_id
      t.references :datasheet, foreign_key: true
      t.references :fourth_weapon, foreign_key: true

      t.timestamps
    end
  end
end

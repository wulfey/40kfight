class CreateThirdWeaponSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :third_weapon_slots do |t|
      t.integer :datasheet_id
      t.integer :third_weapon_id
      t.references :datasheet, foreign_key: true
      t.references :third_weapon, foreign_key: true

      t.timestamps
    end
  end
end

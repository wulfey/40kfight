class CreateFirstWeaponSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :first_weapon_slots do |t|
      t.integer :datasheet_id
      t.integer :first_weapon_id
      t.references :datasheet, foreign_key: true
      t.references :first_weapon, foreign_key: true

      t.timestamps
    end
  end
end

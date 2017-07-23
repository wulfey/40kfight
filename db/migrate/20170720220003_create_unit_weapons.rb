class CreateUnitWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_weapons do |t|
      t.references :weapon, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end

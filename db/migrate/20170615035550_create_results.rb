class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :simulation, foreign_key: true
      t.string :attacker
      t.string :target
      t.string :string
      t.integer :dice
      t.text :description
      t.integer :woundsdealt
      t.float :average
      t.integer :toughness
      t.integer :armor
      t.integer :invul

      t.timestamps
    end
  end
end

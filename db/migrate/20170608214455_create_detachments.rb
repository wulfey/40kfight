class CreateDetachments < ActiveRecord::Migration[5.0]
  def change
    create_table :detachments do |t|
      t.text :name
      t.integer :command_points
      t.integer :min_troops
      t.integer :min_elites
      t.integer :min_fast
      t.integer :min_heavy
      t.integer :min_hq
      t.integer :min_lord
      t.integer :min_flyer
      t.boolean :dedicated_allowed
      t.integer :max_troops
      t.integer :max_elites
      t.integer :max_fast
      t.integer :max_heavy
      t.integer :max_hq
      t.integer :max_lord
      t.integer :max_flyer
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end

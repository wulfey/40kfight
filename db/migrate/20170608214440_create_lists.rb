class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.text :name
      t.boolean :private
      t.integer :used_points
      t.integer :available_points
      t.references :user, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end

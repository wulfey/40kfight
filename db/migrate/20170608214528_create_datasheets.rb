class CreateDatasheets < ActiveRecord::Migration[5.0]
  def change
    create_table :datasheets do |t|
      t.text :name
      t.text :role
      t.integer :power
      t.integer :movemovent
      t.integer :shooting_skill
      t.integer :strength
      t.integer :combat_skill
      t.integer :attacks
      t.integer :wounds
      t.integer :leadership
      t.integer :armor_save
      t.integer :invul_shooting
      t.integer :invul_combat
      t.integer :single_model_point_cost
      t.integer :model_count_increment
      t.integer :power_for_each_increment
      t.integer :min_model_count
      t.integer :max_model_count
      t.boolean :first_slot
      t.boolean :second_slot
      t.boolean :third_slot
      t.boolean :fourth_slot

      t.timestamps
    end
  end
end

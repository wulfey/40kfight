class CreateAttackGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :attack_groups do |t|
      t.references :simulation, foreign_key: true
      t.text :attacker
      t.text :target

      t.timestamps
    end
  end
end

class AddForeignKeysToSimulations < ActiveRecord::Migration[5.0]
  def change

    add_column :simulations, :attacker_id, :integer, index: true
    add_foreign_key :simulations, :units, column: :attacker_id

    add_column :simulations, :target_id, :integer, index: true
    add_foreign_key :simulations, :units, column: :target_id

  end
end

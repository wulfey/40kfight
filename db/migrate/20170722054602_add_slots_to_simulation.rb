class AddSlotsToSimulation < ActiveRecord::Migration[5.0]
  def change
    add_column :simulations, :slot_1, :text
    add_column :simulations, :slot_2, :text
    add_column :simulations, :slot_3, :text
    add_column :simulations, :slot_4, :text
    add_column :simulations, :slot_5, :text
    add_column :simulations, :slot_6, :text
    add_column :simulations, :slot_7, :text
    add_column :simulations, :slot_8, :text
    add_column :simulations, :slot_9, :text
  end
end

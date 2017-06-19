class AddResulttextsToSimulation < ActiveRecord::Migration[5.0]
  def change
    add_column :simulations, :resulttext, :text, array:true, default: []
  end
end

class AddSimulationsToBattle < ActiveRecord::Migration[5.0]
  def change
    add_reference :simulations, :battle, foreign_key: true

    add_reference :lists, :battle, foreign_key: true




  end
end

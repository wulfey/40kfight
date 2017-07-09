class RemoveDumbAttributesFromSimulation < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :results, :dice
    remove_column :results, :description
    remove_column :results, :average
    remove_column :results, :toughness
    remove_column :results, :armor
    remove_column :results, :invul


  end
end

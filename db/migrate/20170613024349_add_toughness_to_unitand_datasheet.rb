class AddToughnessToUnitandDatasheet < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :toughness, :integer, :default => 4
    add_column :datasheets, :toughness, :integer, :default => 4



  end
end

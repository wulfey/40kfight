class AddGoodAttributesToResults < ActiveRecord::Migration[5.0]
  def change

    add_column :results, :hitCount, :integer, :default => 0
    add_column :results, :woundCount, :integer, :default => 0
    add_column :results, :weaponName, :text
    add_column :results, :failedSaves, :integer, :default => 0
    add_column :results, :kills, :integer, :default => 0







  end
end

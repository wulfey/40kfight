class AddRendToFirstweapon < ActiveRecord::Migration[5.0]
  def change

      add_column :first_weapons, :firstShootRend, :integer, :default => 0
      add_column :first_weapons, :secondShootRend, :integer, :default => 0
      add_column :first_weapons, :thirdShootRend, :integer, :default => 0
      add_column :first_weapons, :fourthShootRend, :integer, :default => 0

      add_column :second_weapons, :firstShootRend, :integer, :default => 0
      add_column :second_weapons, :secondShootRend, :integer, :default => 0
      add_column :second_weapons, :thirdShootRend, :integer, :default => 0
      add_column :second_weapons, :fourthShootRend, :integer, :default => 0

      add_column :third_weapons, :firstShootRend, :integer, :default => 0
      add_column :third_weapons, :secondShootRend, :integer, :default => 0
      add_column :third_weapons, :thirdShootRend, :integer, :default => 0
      add_column :third_weapons, :fourthShootRend, :integer, :default => 0

      add_column :fourth_weapons, :firstShootRend, :integer, :default => 0
      add_column :fourth_weapons, :secondShootRend, :integer, :default => 0
      add_column :fourth_weapons, :thirdShootRend, :integer, :default => 0
      add_column :fourth_weapons, :fourthShootRend, :integer, :default => 0



  end
end

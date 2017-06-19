class AddStrToFirstweapon < ActiveRecord::Migration[5.0]
  def change

      add_column :first_weapons, :firstShootStrength, :integer, :default => 4
      add_column :first_weapons, :secondShootStrength, :integer, :default => 4
      add_column :first_weapons, :thirdShootStrength, :integer, :default => 4
      add_column :first_weapons, :fourthShootStrength, :integer, :default => 4

      add_column :second_weapons, :firstShootStrength, :integer, :default => 4
      add_column :second_weapons, :secondShootStrength, :integer, :default => 4
      add_column :second_weapons, :thirdShootStrength, :integer, :default => 4
      add_column :second_weapons, :fourthShootStrength, :integer, :default => 4

      add_column :third_weapons, :firstShootStrength, :integer, :default => 4
      add_column :third_weapons, :secondShootStrength, :integer, :default => 4
      add_column :third_weapons, :thirdShootStrength, :integer, :default => 4
      add_column :third_weapons, :fourthShootStrength, :integer, :default => 4

      add_column :fourth_weapons, :firstShootStrength, :integer, :default => 4
      add_column :fourth_weapons, :secondShootStrength, :integer, :default => 4
      add_column :fourth_weapons, :thirdShootStrength, :integer, :default => 4
      add_column :fourth_weapons, :fourthShootStrength, :integer, :default => 4



  end
end

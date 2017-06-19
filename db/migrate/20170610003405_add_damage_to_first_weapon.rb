class AddDamageToFirstWeapon < ActiveRecord::Migration[5.0]
  def change
      add_column :first_weapons, :firstShootDamage, :integer
      add_column :first_weapons, :secondShootDamage, :integer
      add_column :first_weapons, :thirdShootDamage, :integer
      add_column :first_weapons, :fourthShootDamage, :integer

      add_column :second_weapons, :firstShootDamage, :integer
      add_column :second_weapons, :secondShootDamage, :integer
      add_column :second_weapons, :thirdShootDamage, :integer
      add_column :second_weapons, :fourthShootDamage, :integer

      add_column :third_weapons, :firstShootDamage, :integer
      add_column :third_weapons, :secondShootDamage, :integer
      add_column :third_weapons, :thirdShootDamage, :integer
      add_column :third_weapons, :fourthShootDamage, :integer

      add_column :fourth_weapons, :firstShootDamage, :integer
      add_column :fourth_weapons, :secondShootDamage, :integer
      add_column :fourth_weapons, :thirdShootDamage, :integer
      add_column :fourth_weapons, :fourthShootDamage, :integer


  end
end

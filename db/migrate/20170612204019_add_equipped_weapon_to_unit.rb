class AddEquippedWeaponToUnit < ActiveRecord::Migration[5.0]
  def change
      add_column :units, :equippedFirstWeapon, :integer
      add_column :units, :equippedSecondWeapon, :integer
      add_column :units, :equippedThirdWeapon, :integer
      add_column :units, :equippedFourthWeapon, :integer


  end
end

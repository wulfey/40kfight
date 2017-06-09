class AddNametoFirstWeapon < ActiveRecord::Migration[5.0]
  def change
      add_column :first_weapons, :name, :string
      add_column :second_weapons, :name, :string
      add_column :third_weapons, :name, :string
      add_column :fourth_weapons, :name, :string
  end
end

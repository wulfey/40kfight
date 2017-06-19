class AddWeaponslotsToUnit < ActiveRecord::Migration[5.0]
  def change

      add_reference :first_weapon_slots, :unit, foreign_key: true
      add_reference :second_weapon_slots, :unit, foreign_key: true
      add_reference :third_weapon_slots, :unit, foreign_key: true
      add_reference :fourth_weapon_slots, :unit, foreign_key: true


  end
end

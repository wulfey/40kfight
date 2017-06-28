class AddUnitToWeapons < ActiveRecord::Migration[5.0]
  def change
    add_reference :weapons, :unit, foreign_key: true
  end
end

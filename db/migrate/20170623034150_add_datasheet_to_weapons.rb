class AddDatasheetToWeapons < ActiveRecord::Migration[5.0]
  def change
    add_reference :weapons, :datasheet, foreign_key: true
  end
end

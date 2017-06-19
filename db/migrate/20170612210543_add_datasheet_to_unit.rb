class AddDatasheetToUnit < ActiveRecord::Migration[5.0]
  def change
    add_reference :units, :datasheet, foreign_key: true
  end
end

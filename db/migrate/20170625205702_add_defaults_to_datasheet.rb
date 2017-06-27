class AddDefaultsToDatasheet < ActiveRecord::Migration[5.0]
  def change
      change_column_default :datasheets, :slots, 2
      change_column_default :units, :slots, 2
  end
end

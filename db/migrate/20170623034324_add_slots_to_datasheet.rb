class AddSlotsToDatasheet < ActiveRecord::Migration[5.0]
  def change
    add_column :datasheets, :slots, :integer
  end
end

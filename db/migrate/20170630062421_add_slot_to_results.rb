class AddSlotToResults < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :slot, :integer, :default => 1
  end
end

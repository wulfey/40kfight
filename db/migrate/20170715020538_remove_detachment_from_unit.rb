class RemoveDetachmentFromUnit < ActiveRecord::Migration[5.0]
  def change
    remove_column :units, :detachment_id
    add_reference :units, :battle, foreign_key: true
    add_column :units, :team, :boolean, :default => FALSE
  end
end

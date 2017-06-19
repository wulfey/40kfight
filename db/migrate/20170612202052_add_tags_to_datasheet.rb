class AddTagsToDatasheet < ActiveRecord::Migration[5.0]
  def change
    add_column :datasheets, :tags, :text, array:true, default: []
    add_column :units, :tags, :text, array:true, default: []
  end
end

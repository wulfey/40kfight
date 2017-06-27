class RemoveTagsFromDatasheets < ActiveRecord::Migration[5.0]
  def change



      add_column :datasheets, :faction_keywords, :text, array:true, default: []
      add_column :units, :faction_keywords, :text, array:true, default: []
      add_column :datasheets, :keywords, :text, array:true, default: []
      add_column :units, :keywords, :text, array:true, default: []
  end
end

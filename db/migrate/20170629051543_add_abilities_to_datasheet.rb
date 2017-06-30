class AddAbilitiesToDatasheet < ActiveRecord::Migration[5.0]
  def change
      add_column :datasheets, :abilities, :text, array:true, default: []
  end
end

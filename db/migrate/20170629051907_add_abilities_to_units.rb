class AddAbilitiesToUnits < ActiveRecord::Migration[5.0]
  def change
      add_column :units, :abilities, :text, array:true, default: []
  end
end

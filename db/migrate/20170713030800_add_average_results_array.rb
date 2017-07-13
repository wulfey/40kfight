class AddAverageResultsArray < ActiveRecord::Migration[5.0]
  def change
    add_column :attack_groups, :averages, :text, array:true, default: []
  end
end

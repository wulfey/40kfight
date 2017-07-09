class AddResultsArrayToResults < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :results_array, :text, array:true, default: []
  end
end

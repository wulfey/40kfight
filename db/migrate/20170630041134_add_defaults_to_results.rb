class AddDefaultsToResults < ActiveRecord::Migration[5.0]
  def change
    change_column_default :results, :woundsdealt, 0

  end
end

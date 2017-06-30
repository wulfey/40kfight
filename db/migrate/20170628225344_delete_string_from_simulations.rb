class DeleteStringFromSimulations < ActiveRecord::Migration[5.0]
  def change
      remove_column :results, :string
  end
end

class DeletemovementFromDatasheets < ActiveRecord::Migration[5.0]
  def change

      add_column :datasheets, :movement, :integer
      remove_column :datasheets, :movemovent



  end
end

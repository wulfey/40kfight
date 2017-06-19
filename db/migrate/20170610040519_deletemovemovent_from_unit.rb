class DeletemovementFromUnit < ActiveRecord::Migration[5.0]
  def change

      add_column :units, :movement, :integer
      remove_column :units, :movemovent


  end
end

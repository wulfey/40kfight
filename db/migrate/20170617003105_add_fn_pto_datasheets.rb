class AddFnPtoDatasheets < ActiveRecord::Migration[5.0]
  def change
       add_column :datasheets, :fnp, :integer, default: 7
       add_column :units, :fnp, :integer, default: 7
  end
end

class AddLeaderAttacksToDatasheets < ActiveRecord::Migration[5.0]
  def change
    add_column :datasheets, :leaderAttacks, :integer, default: 1
  end
end

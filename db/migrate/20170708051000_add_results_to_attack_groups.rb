class AddResultsToAttackGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :results, :attack_group, foreign_key: true
  end
end

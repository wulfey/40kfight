class AddCurToDetachments < ActiveRecord::Migration[5.0]
  def change
      add_column :detachments, :cur_troops, :integer
      add_column :detachments, :cur_elites, :integer
      add_column :detachments, :cur_fast, :integer
      add_column :detachments, :cur_heavy, :integer
      add_column :detachments, :cur_hq, :integer
      add_column :detachments, :cur_lord, :integer
      add_column :detachments, :cur_flyer, :integer

  end
end

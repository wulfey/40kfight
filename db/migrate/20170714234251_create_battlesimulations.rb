class CreateBattlesimulations < ActiveRecord::Migration[5.0]
  def change
    create_table :battlesimulations do |t|
      t.belongs_to :battle, index: true
      t.belongs_to :simulation, index: true
      t.timestamps
    end
  end
end

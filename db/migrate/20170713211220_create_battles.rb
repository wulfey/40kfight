class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.text :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

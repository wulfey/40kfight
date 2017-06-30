class CreateDatasheetsAndSimulations < ActiveRecord::Migration[5.0]
  def change
    create_table :simulations_datasheets, id: false do |t|
        t.belongs_to :simulation, index: true
        t.belongs_to :datasheet, index: true
    end

    create_table :simulations_units, id: false do |t|
        t.belongs_to :simulation, index: true
        t.belongs_to :unit, index: true
    end
  end
end

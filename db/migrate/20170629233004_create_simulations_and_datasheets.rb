class CreateSimulationsAndDatasheets < ActiveRecord::Migration[5.0]
  def change

    create_table :datasheets_simulations, id: false do |t|
        t.belongs_to :simulation, index: true
        t.belongs_to :datasheet, index: true
    end

    create_table :units_simulations, id: false do |t|
        t.belongs_to :simulation, index: true
        t.belongs_to :unit, index: true
    end
  end
end

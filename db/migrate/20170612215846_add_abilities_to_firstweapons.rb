class AddAbilitiesToFirstweapons < ActiveRecord::Migration[5.0]
  def change


    add_column :first_weapons, :abilities, :text, array:true, default: []
    add_column :second_weapons, :abilities, :text, array:true, default: []
    add_column :third_weapons, :abilities, :text, array:true, default: []
    add_column :fourth_weapons, :abilities, :text, array:true, default: []
    


  end
end

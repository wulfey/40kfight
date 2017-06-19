class FirstWeapon < ApplicationRecord

     validates :name, uniqueness: true

    has_many :first_weapon_slots
    has_many :datasheets, through: :first_weapon_slot

end

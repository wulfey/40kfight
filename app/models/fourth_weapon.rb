class FourthWeapon < ApplicationRecord

    has_many :fourth_weapon_slots
    
    has_many :datasheets, through: :fourth_weapon_slot
end

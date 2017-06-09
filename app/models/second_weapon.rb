class SecondWeapon < ApplicationRecord

    has_many :second_weapon_slots
    has_many :datasheets, through: :second_weapon_slot

end

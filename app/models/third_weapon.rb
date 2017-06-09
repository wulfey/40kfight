class ThirdWeapon < ApplicationRecord

    has_many :third_weapon_slots
    has_many :datasheets, through: :third_weapon_slot

end

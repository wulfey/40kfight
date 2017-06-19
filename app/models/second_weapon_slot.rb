class SecondWeaponSlot < ApplicationRecord
  belongs_to :datasheet, optional: true
  belongs_to :second_weapon
  belongs_to :unit, optional: true
end

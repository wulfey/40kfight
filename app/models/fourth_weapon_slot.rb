class FourthWeaponSlot < ApplicationRecord
  belongs_to :datasheet, optional: true
  belongs_to :fourth_weapon
  belongs_to :unit, optional: true
end

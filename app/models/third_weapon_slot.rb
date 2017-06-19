class ThirdWeaponSlot < ApplicationRecord
  belongs_to :datasheet, optional: true
  belongs_to :third_weapon
  belongs_to :unit, optional: true
end

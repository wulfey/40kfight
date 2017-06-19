class FirstWeaponSlot < ApplicationRecord
  belongs_to :datasheet, optional: true
  belongs_to :first_weapon
  belongs_to :unit, optional: true
end

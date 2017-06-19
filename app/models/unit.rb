class Unit < ApplicationRecord
  belongs_to :detachment
  belongs_to :datasheet
  has_many :first_weapons, through: :first_weapon_slots
  has_many :second_weapons, through: :second_weapon_slots
  has_many :third_weapons, through: :third_weapon_slots
  has_many :fourth_weapons, through: :fourth_weapon_slots
  has_many :first_weapon_slots, dependent: :destroy
  has_many :second_weapon_slots, dependent: :destroy
  has_many :third_weapon_slots, dependent: :destroy
  has_many :fourth_weapon_slots, dependent: :destroy


  def weapons
      id = self.datasheet_id
      wepAry = []



  end

end

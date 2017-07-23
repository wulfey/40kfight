


class Unit < ApplicationRecord


  belongs_to :battle
  # belongs_to :datasheet
  has_many :unit_weapons, dependent: :destroy
  has_many :weapons, :through => :unit_weapons
  has_many :simulations





end

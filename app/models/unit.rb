


class Unit < ApplicationRecord


  belongs_to :battle
  # belongs_to :datasheet
  has_many :weapons, dependent: :destroy
  has_many :simulations





end

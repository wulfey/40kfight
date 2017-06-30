class Unit < ApplicationRecord


  belongs_to :detachment
  belongs_to :datasheet
  has_many :weapons
  has_and_belongs_to_many :simulations



end

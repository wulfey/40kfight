class Unit < ApplicationRecord


  belongs_to :detachment
  belongs_to :datasheet
  has_many :weapons



end

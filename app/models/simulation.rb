class Simulation < ApplicationRecord
  belongs_to :user
  has_one :unit
  has_one :datasheet
  has_many :results

  


end

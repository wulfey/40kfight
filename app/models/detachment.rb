class Detachment < ApplicationRecord
  belongs_to :list

  has_many :units
end

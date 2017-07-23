class Weapon < ApplicationRecord
      belongs_to :datasheet
      has_many :unit_weapons
end

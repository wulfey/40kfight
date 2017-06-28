class Weapon < ApplicationRecord
      belongs_to :datasheet
      belongs_to :unit
end

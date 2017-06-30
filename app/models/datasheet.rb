class Datasheet < ApplicationRecord

    validates :name, uniqueness: true
    has_many :units, dependent: :destroy
    has_many :weapons
    has_and_belongs_to_many :simulations

end

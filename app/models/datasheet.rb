class Datasheet < ApplicationRecord

    validates :name, uniqueness: true
    has_many :units, dependent: :destroy
    has_many :weapons

end

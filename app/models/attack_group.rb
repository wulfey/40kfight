class AttackGroup < ApplicationRecord
  belongs_to :simulation
  has_many :results, dependent: :destroy
end

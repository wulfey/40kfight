class List < ApplicationRecord
  # belongs_to :user
  belongs_to :battle

  has_many :detachments
  has_many :units, through: :detachments
end

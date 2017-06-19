class User < ApplicationRecord

    validates :email, uniqueness: true
    has_one :simulation
    has_many :lists
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class User < ApplicationRecord

    has_many :messages

    NAME_REGEX = /\w+/

    validates :username, presence: true, uniqueness: { case_sensitive: false },
                         format: { with: /\A#{NAME_REGEX}\z/i },
                         length: { maximum: 15 }
    validates :password, presence: true, length: { minimum: 3 }
    # has_secure_password

    validates :email, uniqueness: true
    has_many :simulations, through: :battles
    has_many :battles
    # has_many :lists
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable








end

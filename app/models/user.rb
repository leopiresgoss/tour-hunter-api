class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :confirmable,
         jwt_revocation_strategy: JwtDenylist

  validates :full_name, presence: true

  has_many :tours, dependent: :destroy
  has_many :reservations, dependent: :destroy
end

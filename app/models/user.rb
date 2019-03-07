class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :availabilities
  has_many :bookings, through: :availabilities
  mount_uploader :avatar, AvatarUploader
  mount_uploader :location, LocationUploader
end

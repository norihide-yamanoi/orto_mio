class User < ApplicationRecord

  has_many :blogs
  has_many :events
  has_many :favorites, dependent: :destroy

  mount_uploader :icon, ImageUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end

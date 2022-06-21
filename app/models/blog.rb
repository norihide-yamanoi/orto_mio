class Blog < ApplicationRecord
  validates :title, :content, presence: true

  mount_uploader :photo, ImageUploader

  belongs_to :user
  belongs_to :event
  has_many :comments, dependent: :destroy
end

class Blog < ApplicationRecord
  validates :title, :content, presence: true

  mount_uploader :photo, ImageUploader

  belongs_to :user
end

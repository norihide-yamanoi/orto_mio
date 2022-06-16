class Blog < ApplicationRecord
  validates :title, :content, presence: true

  mount_uploader :photo, ImageUploader
end

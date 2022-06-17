class Event < ApplicationRecord
  validates :name, :address, :detail, :day, presence: true

  mount_uploader :image, ImageUploader
  enum planting: { "１月": 1,"２月": 2,"３月": 3,"４月": 4,"５月": 5,"６月": 6,"７月": 7,"８月": 8,"９月": 9,"１０月": 10,"１１月": 11,"１２月": 12,"未定": 13 }, _prefix: true
  enum harvest: { "１月": 1,"２月": 2,"３月": 3,"４月": 4,"５月": 5,"６月": 6,"７月": 7,"８月": 8,"９月": 9,"１０月": 10,"１１月": 11,"１２月": 12,"未定": 13 }, _prefix: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end

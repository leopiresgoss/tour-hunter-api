class Tour < ApplicationRecord
  belongs_to :user

  has_many :tour_dates, dependent: :destroy
  has_many_attached :images

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end

class TourDate < ApplicationRecord
  belongs_to :tour

  has_many :reservations, dependent: :destroy

  validates :date, presence: true
end

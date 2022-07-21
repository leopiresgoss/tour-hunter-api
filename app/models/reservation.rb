class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tour_date

  validates :package, presence: true
end

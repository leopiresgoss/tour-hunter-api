class TourSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :price, :image_urls
  has_many :tour_dates
  belongs_to :user
end

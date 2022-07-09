class Tour < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :tour_dates, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :tour_dates

  def image_urls
    images.map do |attachment|
      Rails.application.routes.url_helpers.url_for(attachment)
    end
  end

  # def image_urls
  #   images.map do |attachment|
  #     Rails.application.routes.url_helpers.url_for(attachment)
  #   end
  # end

  # def self.image_urls
  #   self.map(&:image_urls)
  # end

  # def image_urls

  #   return unless images.attachments

  #   image_urls = self.images.map do |image|
  #     url_for(image)
  #   end

  #   image_urls
  # end
end

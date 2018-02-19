class Itinerary < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  validates :trip_title, presence: true
  has_many :images

  def images_attributes=(images_attributes)
    images_attributes.values.each do |image_attributes|
      self.images.build(image_attributes)
    end
  end

  def self.most_recent_by_user(user)
    itineraries = []
    Itinerary.all.order(:datestart).each do |i|
      if i.users.include?(user)
        itineraries << i
      end
    end
    itineraries
  end
end

class Image < ApplicationRecord
  belongs_to :itinerary
  validates :url, format: {
    with: /\.gif|jpg|png|jpeg/, 
    message: "must link to a gif, jpg, or png image."
  }
  validates :url, presence: true
end
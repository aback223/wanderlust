class Day < ApplicationRecord
  belongs_to :itinerary
  has_many :activities
  validates :date, presence: true
  validates :date, uniqueness: true
  validates :title, presence: true
end
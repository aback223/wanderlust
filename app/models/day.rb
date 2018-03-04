class Day < ApplicationRecord
  belongs_to :itinerary
  has_many :activities
  validates :date, presence: true
  validates :date, uniqueness: true
  validates :title, presence: true
  validate :within_date_range, if: :date?

  def within_date_range
    itinerary = Itinerary.find_by_id(self.itinerary_id)
    if date < itinerary.datestart || date > itinerary.dateend
      errors.add(:date, "must be in the range: #{itinerary.datestart.strftime("%m/%d/%Y")} - #{itinerary.dateend.strftime("%m/%d/%Y")}")
    end
  end
end
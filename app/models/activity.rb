class Activity < ApplicationRecord
  belongs_to :day
  validates :title, presence: true
end
class Activity < ApplicationRecord
  belongs_to :day
  validates :title, presence: true
  has_many :activity_categories
  has_many :categories, through: :activity_categories
end
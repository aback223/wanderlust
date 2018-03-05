class Activity < ApplicationRecord
  belongs_to :day
  validates :title, presence: true
  has_many :activity_categories
  has_many :categories, through: :activity_categories
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
end
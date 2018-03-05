class ActivityCategory < ActiveRecord::Base
  has_many :activities
  has_many :categories
end
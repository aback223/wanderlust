class ActivityCategory < ActiveRecord::Base
  belongs_to :activities
  belongs_to :categories
end
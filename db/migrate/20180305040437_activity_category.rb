class ActivityCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_categories do |t|
      t.belongs_to :activity
      t.belongs_to :category
    end
  end
end

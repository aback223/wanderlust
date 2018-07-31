class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string  :title
      t.string  :activity_type
      t.string  :address
      t.string  :url
      t.string  :notes
      t.integer :day_id
    end
  end
end

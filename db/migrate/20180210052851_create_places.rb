class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.integer :itinerary_id

      t.timestamps
    end
  end
end

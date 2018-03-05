class DropTrips < ActiveRecord::Migration[5.0]
  def change
    drop_table :trips
  end
end

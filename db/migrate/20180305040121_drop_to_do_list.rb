class DropToDoList < ActiveRecord::Migration[5.0]
  def change
    drop_table :to_do_lists
  end
end

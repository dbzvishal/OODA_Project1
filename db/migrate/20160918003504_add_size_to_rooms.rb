class AddSizeToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :size, :integer
    add_column :rooms, :room, :string
  end
end

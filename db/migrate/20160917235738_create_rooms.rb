class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :rnumber

      t.timestamps
    end
  end
end

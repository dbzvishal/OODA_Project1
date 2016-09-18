class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :user
    remove_column :rooms, :room
  end
end

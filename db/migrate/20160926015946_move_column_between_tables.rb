class MoveColumnBetweenTables < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams_users, :notification
    add_column :users, :notification, :boolean
  end
end

class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :notification
    add_column :users, :notification, :string
  end
end

class RemoveUphoneFromUser < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :users, :uphone
    remove_column :admins, :aphone
  end
end

class AddNotificationsToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams_users, :notification, :boolean
  end
end

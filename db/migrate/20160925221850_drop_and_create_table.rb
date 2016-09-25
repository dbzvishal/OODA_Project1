class DropAndCreateTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :teams_users

    create_table :teams_users, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true
    end
  end
end

class CreateTeam < ActiveRecord::Migration[5.0]
  def change
    drop_table :teams

    create_table :teams do |t|
      t.string :name
      t.timestamps
    end

    create_table :teams_users, id: false do |t|
      t.belongs_to :teams, index: true
      t.belongs_to :users, index: true
    end
  end
end
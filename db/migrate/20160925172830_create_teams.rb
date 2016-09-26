class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :name
      t.boolean :notification
    end

    add_reference :teams, :users, index: true, foreign_key: true
  end
end
class ChangeForeignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_reference :rooms, :buildings, index: true
    add_reference :rooms, :building, index: true, foreign_key: true
  end
end

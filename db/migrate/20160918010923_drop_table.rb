class DropTable < ActiveRecord::Migration[5.0]
  def self.up
    drop_table :admins
  end
end

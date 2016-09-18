class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uname
      t.string :uemail
      t.integer :uphone
      t.string :password

      t.timestamps
    end
  end
end

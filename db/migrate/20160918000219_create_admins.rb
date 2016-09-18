class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :aname
      t.string :aemail
      t.integer :aphone
      t.string :apassword

      t.timestamps
    end
  end
end

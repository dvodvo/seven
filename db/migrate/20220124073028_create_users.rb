class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.datetime :confirmed_at
      t.string :password_digest, null: false
      t.string :unconfirmed_email
      t.string :remember_token, null: false
      t.string :session_token, null: false

      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :remember_token, unique: true
    add_index :users, :session_token, unique: true
  end
end

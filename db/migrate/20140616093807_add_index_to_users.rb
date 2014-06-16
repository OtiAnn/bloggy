class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :email, :name => "index_users_on_email", :unique => true
    add_index :users, :reset_password_token, :name => "index_users_on_reset_password_token", :unique => true
  end
end

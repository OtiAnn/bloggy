class Users < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :email, :string, :default => "", :null => false
    add_column :users, :encrypted_password, :string, :default => "", :null => false
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_column :users, :sign_in_count, :integer, :default => 0, :null => false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
    add_column :users, :admin, :boolean, :default => false
  end
end

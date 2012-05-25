class AddDeviseToUsers < ActiveRecord::Migration
  def change
    ## Database authenticatable
    add_column :users, :account, :string
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Trackable
    add_column :users, :sign_in_count, :integer, :default => 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    
    add_index :users, :account, :unique => true
  end
end

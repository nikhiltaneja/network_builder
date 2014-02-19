class AddAttributesToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :headline, :string
    add_column :users, :industry, :string
    add_column :users, :location, :string
    add_column :users, :image, :string
    add_column :users, :public_profile, :string
  end
end

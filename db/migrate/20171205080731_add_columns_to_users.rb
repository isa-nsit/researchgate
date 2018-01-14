class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :branch, :string
  	add_column :users, :percentage, :string
  	add_column :users, :year, :string
  	add_column :users, :profile_pic, :string
  end
end

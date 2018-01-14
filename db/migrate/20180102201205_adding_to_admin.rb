class AddingToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins ,:designation,:string
  	 add_column :admins ,:namehref,:string
  end
end

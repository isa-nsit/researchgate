class RemoveFromAdmin < ActiveRecord::Migration
  def change

  	remove_column :admins, :bio
  	remove_column :admins, :designation

  end
end

class AddPicToAdmins < ActiveRecord::Migration
  def change
  	add_column :admins, :pic, :string
  end
end

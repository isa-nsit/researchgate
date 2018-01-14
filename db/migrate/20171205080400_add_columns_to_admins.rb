class AddColumnsToAdmins < ActiveRecord::Migration
  def change
  	add_column :admins, :name, :string
  	add_column :admins, :bio, :text
  	add_column :admins, :qualifications, :string
  	add_column :admins, :designation, :string
  	add_column :admins, :division, :string
  	add_column :admins, :contact_no, :string
  end
end

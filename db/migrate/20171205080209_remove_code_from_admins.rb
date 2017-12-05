class RemoveCodeFromAdmins < ActiveRecord::Migration
  def change
  	remove_column :admins, :unique_code
  end
end

class RemovecontactNoFromAdmin < ActiveRecord::Migration
  def change
  	remove_column :admins, :contact_no

  end
end

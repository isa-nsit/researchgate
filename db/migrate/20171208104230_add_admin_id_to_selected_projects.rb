class AddAdminIdToSelectedProjects < ActiveRecord::Migration
  def change
    add_column :selected_projects, :admin_id, :integer
  end
end

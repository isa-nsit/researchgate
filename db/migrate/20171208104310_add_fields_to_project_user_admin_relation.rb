class AddFieldsToProjectUserAdminRelation < ActiveRecord::Migration
  def change
  	add_column :project_user_admin_relations,:user_id1,:integer
  	add_column :project_user_admin_relations,:user_id2,:integer
  	add_column :project_user_admin_relations,:user_id3,:integer
  	add_column :project_user_admin_relations,:user_id4,:integer
  	add_column :project_user_admin_relations,:user_id5,:integer
  end
end

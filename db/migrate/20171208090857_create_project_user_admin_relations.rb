class CreateProjectUserAdminRelations < ActiveRecord::Migration
  def change
    create_table :project_user_admin_relations do |t|
      t.references :admin, index: true,type: :integer, foreign_key: true
      t.references :user, index: true,type: :integer, foreign_key: true
      t.references :selected_projects, index: true,type: :integer, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateProjectUserAdminRelations < ActiveRecord::Migration
  def change
    create_table :project_user_admin_relations do |t|
      t.references :admin, index: true,type: :uuid, foreign_key: true
      t.references :user, index: true, type: :uuid,type: :uuid,foreign_key: true
      t.references :SelectedProject, index: true,type: :uuid, foreign_key: true

      t.timestamps null: false
    end
  end
end

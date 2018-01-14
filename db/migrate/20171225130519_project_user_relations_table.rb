class ProjectUserRelationsTable < ActiveRecord::Migration
  def up
    drop_table :project_user_relations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

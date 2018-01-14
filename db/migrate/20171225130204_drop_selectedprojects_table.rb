class DropSelectedprojectsTable < ActiveRecord::Migration
  def up
    drop_table :selectedprojects
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

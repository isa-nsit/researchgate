class CreateProjectUserRelations < ActiveRecord::Migration
  def change
    create_table :project_user_relations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :Selectedproject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

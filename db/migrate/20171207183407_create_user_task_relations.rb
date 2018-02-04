class CreateUserTaskRelations < ActiveRecord::Migration
  def change
    create_table :user_task_relations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

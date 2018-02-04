class AddTableUserTaskRelation < ActiveRecord::Migration
  def change
    create_table :user_task_relations do |t|
      t.references :user, index: true,type: :integer, foreign_key: true
      t.references :task, index: true,type: :integer, foreign_key: true

      t.timestamps null: false
    end
  end
end

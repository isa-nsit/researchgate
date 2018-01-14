class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :branch
      t.string :percentage
      t.string :year
      t.string :task_name
      t.string :task_desc
      t.integer :members_count

      t.timestamps null: false
    end
  end
end

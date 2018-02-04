class CreateTaskCreates < ActiveRecord::Migration
  def change
    create_table :task_creates do |t|

      t.timestamps null: false
    end
  end
end

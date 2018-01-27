class CreateSendTaskWorkers < ActiveRecord::Migration
  def change
    create_table :send_task_workers do |t|

      t.timestamps null: false
    end
  end
end

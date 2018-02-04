class CreateRejectedWorkers < ActiveRecord::Migration
  def change
    create_table :rejected_workers do |t|

      t.timestamps null: false
    end
  end
end

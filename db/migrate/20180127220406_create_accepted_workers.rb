class CreateAcceptedWorkers < ActiveRecord::Migration
  def change
    create_table :accepted_workers do |t|

      t.timestamps null: false
    end
  end
end

class AddUpdateCountToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :update_count, :integer, :default => 0
  end
end

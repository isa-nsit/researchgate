class AddEmail5ToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :email5, :string
  end
end

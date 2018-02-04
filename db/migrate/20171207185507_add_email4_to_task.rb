class AddEmail4ToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :email4, :string
  end
end

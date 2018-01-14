class AddEmail1ToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :email1, :string
  end
end

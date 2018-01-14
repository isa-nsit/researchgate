class AddEmail3ToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :email3, :string
  end
end

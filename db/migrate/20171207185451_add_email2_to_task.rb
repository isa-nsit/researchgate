class AddEmail2ToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :email2, :string
  end
end

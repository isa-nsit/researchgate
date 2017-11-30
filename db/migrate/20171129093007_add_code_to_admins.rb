class AddCodeToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :unique_code, :string
  end
end

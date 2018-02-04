class AddAdminNameToEligibility < ActiveRecord::Migration
  def change
  	add_column :eligibilities, :faculty_name, :string
  end
end

class AddingToMeraAdmin < ActiveRecord::Migration
  def change
  	add_column :admins,:AOI,:string
  end
end

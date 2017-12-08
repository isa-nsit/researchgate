class CreateSelectedProjects < ActiveRecord::Migration
  def change
    create_table :selected_projects do |t|
      t.string :ProjectName
      t.text :Description
      t.string :email1
      t.string :email2
      t.string :email3
      t.string :email4
      t.string :email5

      t.timestamps null: false
    end
  end
end

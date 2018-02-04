class CreateCompleteProjects < ActiveRecord::Migration
  def change
    create_table :complete_projects do |t|
      t.references :SelectedProject, index: true, foreign_key: true
      t.references :Admin, index: true, foreign_key: true
      t.string :user1
      t.string :user2
      t.string :user3
      t.string :user4
      t.string :user5

      t.timestamps null: false
    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :desc
      t.string :category
      t.integer :limit

      t.timestamps null: false
    end
  end
end

class CreateSelectedprojects < ActiveRecord::Migration
  def change
    create_table :selectedprojects do |t|
      t.string :name
      t.string :desc
      t.integer :members_count

      t.timestamps null: false
    end
  end
end

class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :string
      t.string :year
      t.string :string
      t.string :branch
      t.string :string
      t.string :sop
      t.string :string

      t.timestamps null: false
    end
  end
end

class CreateEligibilities < ActiveRecord::Migration
  def change
    create_table :eligibilities do |t|
      t.string :percentage
      t.integer :sems_complete
      t.string :branch
      t.string :period

      t.timestamps null: false
    end
  end
end

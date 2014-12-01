class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :section_id
      t.string :name
      t.string :type
      t.datetime :date_assigned
      t.datetime :date_due
      t.integer :total_points

      t.timestamps
    end
  end
end

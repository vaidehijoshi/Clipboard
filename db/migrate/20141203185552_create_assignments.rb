class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :type
      t.datetime :date_assigned
      t.datetime :date_due
      t.integer :points
      t.integer :course_section_id
      t.timestamps
    end
  end
end

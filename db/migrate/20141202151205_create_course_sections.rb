class CreateCourseSections < ActiveRecord::Migration
  def change
    create_table :course_sections do |t|
      t.integer :course_teacher_assignment_id
      t.string :name
      t.timestamps
    end
  end
end

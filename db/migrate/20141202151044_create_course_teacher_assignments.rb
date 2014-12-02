class CreateCourseTeacherAssignments < ActiveRecord::Migration
  def change
    create_table :course_teacher_assignments do |t|
      t.integer :teacher_id
      t.integer :course_id
      t.timestamps
    end
  end
end

class CreateStudentCourseSections < ActiveRecord::Migration
  def change
    create_table :student_course_sections do |t|
      t.integer :student_id
      t.integer :course_section_id
      
      t.timestamps
    end
  end
end

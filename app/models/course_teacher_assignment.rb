class CourseTeacherAssignment < ActiveRecord::Base
  has_many :course_sections
  
  belongs_to :teacher
  belongs_to :course

end

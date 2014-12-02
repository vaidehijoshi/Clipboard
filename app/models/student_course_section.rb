class StudentCourseSection < ActiveRecord::Base
  belongs_to :course_section
  belongs_to :student
end

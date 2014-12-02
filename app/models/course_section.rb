class CourseSection < ActiveRecord::Base
  belongs_to :course_teacher_assignment
  has_many :student_course_sections
  has_many :buddyships
  has_many :enemyships
end

class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :course_teacher_assignments
  has_many :courses, through: :course_teacher_assignments
  has_many :course_sections, through: :course_teacher_assignments
  has_many :student_course_sections, through: :course_sections
  has_many :students, through: :student_course_sections
end

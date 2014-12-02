class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :course_teacher_assignments
  has_many :courses, through: :course_teacher_assignments
end

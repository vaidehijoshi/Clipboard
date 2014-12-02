class Course < ActiveRecord::Base
  belongs_to :school
  has_many :course_teacher_assignments
  has_many :teachers, through: :course_teacher_assignments
end

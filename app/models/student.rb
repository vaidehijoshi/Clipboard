class Student < ActiveRecord::Base
  has_many :student_course_sections
  has_many :course_sections, through: :student_course_sections
  has_many :course_teacher_assignments, through: :course_sections
  has_many :teachers, through: :course_teacher_assignments
  has_many :courses, through: :course_teacher_assignments
  has_many :enemyships
  has_many :enemies, through: :enemyships
  has_many :buddyships
  has_many :buddies, through: :buddyships


  def full_name
    first_name + " " + last_name
  end

end

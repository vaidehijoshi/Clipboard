class Student < ActiveRecord::Base
  has_many :student_course_sections
  has_many :course_sections, through: :student_course_sections
  has_many :enemyships
  has_many :enemies, through: :enemyships
  has_many :buddyships
  has_many :buddies, through: :buddyships
end

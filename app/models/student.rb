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
  has_many :guardians
  has_many :scores
  has_many :assignments, through: :course_sections

  def full_name
    first_name + " " + last_name
  end

  def has_enemies_at_table?(table)
    enemies.each do |enemy|
      if table.include?(enemy)
        return true
      end
    end
    false
  end

  def has_buddies_at_table?(table)
    buddies.each do |buddy|
      if table.include?(buddy)
        return true
      end
    end
    false

  def guardian_ids
    guardians.pluck(:id)
  end


end

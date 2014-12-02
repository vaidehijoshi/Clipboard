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


  has_many :inverse_enemyships, :class_name => "Enemyship", :foreign_key => "enemy_id"
  has_many :inverse_enemies, through: :inverse_enemyships, :source => :student
  has_many :inverse_buddyships, :class_name => "Buddyship", :foreign_key => "buddy_id"
  has_many :inverse_buddies, through: :inverse_buddyships, :source => :student


  def all_buddies
    self.buddies.push(self.inverse_buddies)
  end

  def all_enemies
    self.enemies.push(self.inverse_enemies)
  end

end

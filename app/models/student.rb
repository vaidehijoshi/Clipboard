class Student < ActiveRecord::Base
  has_many :section_students
  has_many :sections, through: :section_students
  has_many :subjects, through: :sections
  has_many :absences
  has_many :tardies
  has_many :teachers, through: :subjects
  has_many :guardians
  has_many :work_buddies
  has_many :work_enemies
  has_many :grades

  validates :first_name, :last_name, presence: true

  def buddies
    buddy_ids = WorkBuddy.where(:buddy_one_id => self.id).pluck(:buddy_two_id)
    buddy_ids.push(WorkBuddy.where(:buddy_two_id => self.id).pluck(:buddy_one_id))
    Student.where(:id => buddy_ids)
  end

  def enemies
    enemy_ids = WorkEnemy.where(:enemy_one_id => self.id).pluck(:enemy_two_id)
    enemy_ids.push(WorkEnemy.where(:enemy_two_id => self.id).pluck(:enemy_one_id))
    Student.where(:id => enemy_ids)
  end

end

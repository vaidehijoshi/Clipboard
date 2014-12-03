class Enemyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :enemy, class_name: 'Student', foreign_key: 'enemy_id'
  belongs_to :course_section
  after_create :inversify
  after_destroy :destroy_inverse
  validates_uniqueness_of :student, :scope => [:enemy, :course_section_id]
  validates_uniqueness_of :enemy, :scope => [:student, :course_section_id]
  validate :cant_be_own_enemy, :cant_be_buddies_and_enemies

  def inversify
    self.enemy.enemyships.create(:course_section_id => self.course_section_id, :enemy_id => self.student.id)
  end

  def destroy_inverse
    if inverse = self.enemy.enemyships.where(:enemy_id => self.student.id, :course_section_id => self.course_section_id).first
      inverse.destroy
    end
  end

  private
  def cant_be_own_enemy
    if student_id == enemy_id
      errors.add(:enemy_id, "you can't be your own enemy! :(")
    end
  end

  def cant_be_buddies_and_enemies
    if Buddyship.find_by(student_id: student_id, buddy_id: enemy_id, course_section_id: course_section_id)
      errors.add(:enemy_id, "you can't be both buddies and enemies for the same class! :(")
    end
  end
  
end

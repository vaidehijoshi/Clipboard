class Enemyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :enemy, class_name: 'Student', foreign_key: 'enemy_id'
  belongs_to :course_section
  after_create :inversify
  after_destroy :destroy_inverse
  validates_uniqueness_of :student, :scope => :enemy
  validates_uniqueness_of :enemy, :scope => :student
  validate :cant_be_own_enemy

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
  
end

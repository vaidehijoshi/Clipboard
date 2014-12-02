class Enemyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :enemy, class_name: 'Student', foreign_key: 'enemy_id'
  belongs_to :course_section
  after_create :inversify
  validates_uniqueness_of :student, :scope => :enemy
  validates_uniqueness_of :enemy, :scope => :student

  def inversify
    self.enemy.enemyships.create(:course_section_id => self.course_section_id, :enemy_id => self.student.id)
  end

  # def destroy_uninverse
  #   self.enemy.enemyships.where(:enemy_id => self.student.id, :course_section_id => self.course_section_id).first.destroy
  # end

  def destroy_relationship
    self.class.where(:student_id => self.enemy_id, :enemy_id => self.student_id, :course_section_id => self.course_section_id).first.destroy
    self.destroy
  end
  
end

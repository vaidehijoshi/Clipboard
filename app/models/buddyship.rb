class Buddyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :buddy, class_name: 'Student', foreign_key: 'buddy_id'
  belongs_to :course_section
  after_create :inversify
  after_destroy :destroy_inverse
  validates_uniqueness_of :student, :scope => [:buddy, :course_section_id]
  validates_uniqueness_of :buddy, :scope => [:student, :course_section_id]
  validate :cant_be_own_buddy, :cant_be_buddies_and_enemies

  def inversify
    self.buddy.buddyships.create(:course_section_id => self.course_section_id, :buddy_id => self.student.id)
  end

  def destroy_inverse
    if inverse = self.buddy.buddyships.where(:buddy_id => self.student.id, :course_section_id => self.course_section_id).first
      inverse.destroy
    end
  end

  private
  def cant_be_own_buddy
    if student_id == buddy_id
      errors.add(:buddy_id, "you can't be your own buddy! :(")
    end
  end

  def cant_be_buddies_and_enemies
    if Enemyship.find_by(student_id: student_id, enemy_id: buddy_id, course_section_id: course_section_id)
      errors.add(:buddy_id, "you can't be both buddies and enemies for the same class! :(")
    end
  end

end

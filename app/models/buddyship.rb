class Buddyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :buddy, class_name: 'Student', foreign_key: 'buddy_id'
  belongs_to :course_section
  after_create :inversify
  after_destroy :destroy_inverse
  validates_uniqueness_of :student, :scope => :buddy
  validates_uniqueness_of :buddy, :scope => :student
  validate :cant_be_own_buddy

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

end

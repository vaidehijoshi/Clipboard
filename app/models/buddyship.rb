class Buddyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :buddy, class_name: 'Student', foreign_key: 'buddy_id'
  belongs_to :course_section
  after_create :inversify
  after_destroy :destroy_inverse
  validates_uniqueness_of :student, :scope => :buddy
  validates_uniqueness_of :buddy, :scope => :student

  def inversify
    self.buddy.buddyships.create(:course_section_id => self.course_section_id, :buddy_id => self.student.id)
  end

  def destroy_inverse
    if inverse = self.buddy.buddyships.where(:buddy_id => self.student.id, :course_section_id => self.course_section_id).first
      inverse.destroy
    end
  end

end

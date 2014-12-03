class StudentCourseSection < ActiveRecord::Base
  belongs_to :course_section
  belongs_to :student


  validates_uniqueness_of :student, scope: :course_section, messages: "That student is already in this class"



end

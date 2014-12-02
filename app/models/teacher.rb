class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :course_teacher_assignments
  has_many :courses, through: :course_teacher_assignments
  has_many :course_sections, through: :course_teacher_assignments
  has_many :student_course_sections, through: :course_sections
  has_many :students, through: :student_course_sections

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :title, presence: true

  def full_name
    self.title + " " + self.first_name + " " + self.last_name
  end
end

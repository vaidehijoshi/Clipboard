class CourseSection < ActiveRecord::Base
  belongs_to :course_teacher_assignment
  delegate :course, to: :course_teacher_assignment
  delegate :teacher, to: :course_teacher_assignment
  has_many :student_course_sections
  has_many :students, through: :student_course_sections
  has_many :courses, :through => :course_sections
  has_many :buddyships
  has_many :enemyships
  has_many :assignments
  has_many :guardians, through: :students

  validates :name, presence: true

  def students_with_guardians
    students.joins(:guardians).uniq
  end

  def students_without_guardians
    students.where.not(id: guardians.pluck(:student_id))
  end
end


#Student.joins('LEFT OUTER JOIN guardians ON students.id = guardians.student_id').where(guardians: { id: nil }).uniq
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

  validates :name, presence: true

  def students_in_class
    students.all.each_with_object([]) do |student, kids|
      kids << student
    end
  end


  ## has friends, no enemies
  def good_kids
    good_kids = []
    students_in_class.each_with_index do |kid, i|
      if (kid.enemies.size == 0 && kid.buddies.size >= 1)
        good_kids.push(students_in_class.delete_at(i))
      end
    end
    good_kids
  end

  def neutral_kids
    # neutral_kids = []
    # students_in_class.each_with_index do |kid, i|
    #   if (kid.enemies.size == 0 || kid.buddies.size == 0)
    #   end
    # end
  end

  def trouble_kids
    bad_kids = []
    students_in_class.each_with_index do |kid, i|
      if (kid.enemies.size > 0)
        bad_kids.push(students_in_class.delete_at(i))
      end
    end
    bad_kids
  end


  def group_buddies
    classroom_pairs = []

    self.buddyships.each do |buddyship|
      pairs = []
      pairs << Student.find(buddyship.student)
      pairs << Student.find(buddyship.buddy)
      classroom_pairs << pairs
    end

    classroom_pairs
  end


  # 1. Find all pairs of enemies in a classroom 
  # 2. Separate them into different groups 
  # 3. Then add pairs of buddies to groups
  # 4. Add remaining neutral kids to fill in


end

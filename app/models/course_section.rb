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
    # good_kids = []
    # students_in_class.each_with_index do |kid, i|
    #   if (kid.enemies.size == 0 && kid.buddies.size >= 1)
    #     good_kids.push(students_in_class.delete_at(i))
    #   end
    # end
    # good_kids
  end

  def neutral_kids
    neutral = []
    students_in_class.each do |student|
      if !(trouble_kids.include?(student))
        neutral << student
      end
    end
    neutral
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

  def groups_of(students_per_group)
    number_of_groups = self.students.size / students_per_group
    tables_array = Array.new(number_of_groups, [])

    
      tables_array.each do |table|
        trouble_kids.each do |kid|
          if table.length < students_per_group
            table << kid.full_name
            trouble_kids.delete(kid)
          end
        end
      end
    


    # for i in 0..trouble_kids.length-1
    #   kid = trouble_kids.sample
    #   tables_array.each do |table|
    #     kid.enemies.each do | enemy|
    #       if !(table.include?(enemy))
    #         index = trouble_kids.index(kid)
    #         table << (trouble_kids.delete_at(index))
    #       end
    #     end     
    #   end
    # end

    tables_array
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

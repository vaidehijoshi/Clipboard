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
  has_many :groups
  

  validates :name, presence: true


  def students_in_class
    students.to_a
  end

  def trouble_kids
    bad_kids = []
    current_students = students.to_a
    current_students.each_with_index do |kid, i|
      if (kid.enemies.size > 0)
        bad_kids.push(current_students.delete_at(i))
      end
    end
    bad_kids
  end



  def make_groups_of(max_kids_per_table) # 5
    if self.students.size % max_kids_per_table != 0
      number_of_groups = self.students.size / max_kids_per_table + 1
    else
      number_of_groups = self.students.size / max_kids_per_table  # 40 / 5 = 8
    end

    all_groups_array = [] # to hold all the groups when they're made
    all_kids = students.to_a.shuffle
    seated_kids = []
    # binding.pry

    number_of_groups.times do
      new_table = []
      all_kids.each_with_index do |kid, index|
        # if seated_kids.count == all_kids.count
        if seated_kids.include?(kid)
          
          break
        else
          if new_table.size == max_kids_per_table
            # all_groups_array << new_table
            break
          elsif new_table.include?(kid)
            break
          elsif kid.has_enemies_at_table?(new_table)
            break
          else
            new_table << kid
            # binding.pry
            seated_kids << all_kids.delete_at(index)
          end
        end
      end
      all_groups_array << new_table
      puts "new table"
      puts new_table
      puts "all groups array"
      puts all_groups_array
    end

    place_these_kids = all_kids.dup
    place_these_kids.each_with_index do |kid|
      all_groups_array.each do |group|
        if group.size < max_kids_per_table && !kid.has_enemies_at_table?(group)
          group << kid
          seated_kids << all_kids.shift
        end
      end
    end

    course_groupings = {:groups => all_groups_array, :unplaceable => all_kids}
    
    # binding.pry

    
  end



  def students_with_guardians
    students.where(id: guardians.pluck(:student_id))
  end

  def students_without_guardians
    students.where.not(id: guardians.pluck(:student_id))
  end

end

  # 1. Find all pairs of enemies in a classroom 
  # 2. Separate them into different groups 
  # 3. Then add pairs of buddies to groups
  # 4. Add remaining neutral kids to fill in

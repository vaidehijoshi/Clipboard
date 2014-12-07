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
  has_many :scores, through: :assignments
  has_many :guardians, through: :students
  has_many :groups
  

  validates :name, presence: true
  validates :name, uniqueness: true


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

  def kids_with_buddies_no_enemies
    self.students.select{|student| !student.buddies.empty? && student.enemies.empty? }
  end

  def kids_with_buddies_and_enemies
    self.students.select{|student| !student.buddies.empty? && !student.enemies.empty? }
  end

  def kids_with_no_buddies_or_enemies
    self.students.select{|student| student.buddies.empty? && student.enemies.empty? }
  end

  def kids_with_enemies_no_buddies
    self.students.select{|student| student.buddies.empty? && !student.enemies.empty? }
  end

  def all_kids_by_buddy_and_enemyships
    kids_with_enemies_no_buddies.shuffle +
    kids_with_buddies_and_enemies.shuffle + 
    kids_with_buddies_no_enemies.shuffle + 
    kids_with_no_buddies_or_enemies.shuffle
  end

  def make_groups_of(max_kids_per_group) # 5
    if self.students.size % max_kids_per_group != 0
      number_of_groups = self.students.size / max_kids_per_group + 1
    else
      number_of_groups = self.students.size / max_kids_per_group  # 40 / 5 = 8
    end
    unseatable_kids = []
    all_groups_array = [] # to hold all the groups when they're made
    all_kids = all_kids_by_buddy_and_enemyships
    number_of_groups.times do 
      all_groups_array << []
    end
    groups_checked = 0
    kid_seated = false
    all_kids.each do |kid|
      kid_seated = false
      groups_checked = 0
      while kid_seated == false && groups_checked < number_of_groups
        # TRY TO SEAT KID WITH A BUDDY
        all_groups_array.each do |group|
          if group.size < max_kids_per_group && kid.has_buddies_at_table?(group) && !kid.has_enemies_at_table?(group)
            group << kid
            kid_seated = true
            break
          end
        end
        if kid_seated == false
          all_groups_array.each do |group|
            groups_checked += 1
            if group.size < max_kids_per_group && !kid.has_enemies_at_table?(group)
              group << kid
              kid_seated = true
              break
            end
          end
        end
      end
      if kid_seated == false
        unseatable_kids << kid
      end
    end
    kids_seated_with_buddies = 0
    all_groups_array.each do |group|
      group.each do |kid|
        if kid.has_buddies_at_table?(group)
          kids_seated_with_buddies += 1
        end
      end
    end
    course_groupings = {:groups => all_groups_array, :unplaceable => unseatable_kids, :kids_seated_with_buddies => kids_seated_with_buddies}
  end

  def optimized_grouping(max_kids_per_group)
    best_grouping_so_far = nil
    kids_seated_with_buddies = 0
    1000.times do 
      current_grouping = make_groups_of(max_kids_per_group)
      if current_grouping[:kids_seated_with_buddies] > kids_seated_with_buddies
        kids_seated_with_buddies = current_grouping[:kids_seated_with_buddies]
        best_grouping_so_far = current_grouping
      end
    end
    best_grouping_so_far
  end


#### WHATEVER WE DO, WE MUST HAVE THIS RETURNED!
#course_groupings = {:groups => all_groups_array, :unplaceable => place_these_kids}

  #   seated_kids = []
  #   # binding.pry

  #   number_of_groups.times do
  #     new_table = []
  #     all_kids.each_with_index do |kid, index|
  #       # if seated_kids.count == all_kids.count
  #       if seated_kids.include?(kid)
          
  #         break
  #       else
  #         if new_table.size == max_kids_per_table
  #           # all_groups_array << new_table
  #           break
  #         elsif new_table.include?(kid)
  #           break
  #         elsif kid.has_enemies_at_table?(new_table)
  #           break
  #         else
  #           new_table << kid
  #           # binding.pry
  #           seated_kids << all_kids.delete_at(index)
  #         end
  #       end
  #     end
  #     all_groups_array << new_table
  #     puts "new table"
  #     puts new_table
  #     puts "all groups array"
  #     puts all_groups_array
  #   end

  #   place_these_kids = all_kids.dup
  #   place_these_kids.each_with_index do |kid|
  #     all_groups_array.each do |group|
  #       if group.size < max_kids_per_table && !kid.has_enemies_at_table?(group)
  #         group << kid
  #         seated_kids << place_these_kids.shift
  #       end
  #     end
  #   end

  #   
    
  #   # binding.pry

    
  # end



  def students_with_guardians
    students.joins(:guardians).uniq
  end

  def students_without_guardians
    students.where.not(id: guardians.pluck(:student_id))
  end

end



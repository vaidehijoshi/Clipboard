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


  # def students_in_class
  #   students.all.each_with_object([]) do |student, kids|
  #     kids << student
  #   end
  # end



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
    current_students = students.to_a
    current_students.each_with_index do |kid, i|
      if (kid.enemies.size > 0)
        bad_kids.push(current_students.delete_at(i))
      end
    end
    bad_kids
  end

  def groups_of(students_per_group) #(5)
    number_of_groups = self.students.size / students_per_group  # 40 / 5 = 8
    tables_array = Array.new(number_of_groups, []) # [[],[],[],[],[],..]
    bad_kids = trouble_kids


    i = 0 # which student
    j = 0 # WHICH table 0 - 7 
    while (i <= bad_kids.length) do 
      
      table = tables_array[j]

      k = 0 # how full is the table
      while (j <= number_of_groups - 1 ) 

        if k < students_per_group # If the table isn't full, add the student to it. also add to fullness
          kid = bad_kids[i]  
          puts " i: student index = #{i} ////// j: table index = #{j} /////// k: table fullness = #{k}"
          puts kid.full_name 
          table << kid.full_name 
          
          i += 1 
          k += 1
        else
        # else k >= students_per_group #If it is full, go to next table
          j += 1
          table = tables_array[j]
        end

        # puts "WAAAH"
      end 


       # j =1
      # puts "end of loop!!"
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

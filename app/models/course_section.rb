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



#   def groups_of(students_per_group) #(5)
#     number_of_groups = self.students.size / students_per_group  # 40 / 5 = 8
#     tables_array = []
#     all_kids = students_in_class

#     k = 0 # how full a table is
#     i = 0 # which student 0 - 39
#     j = 0 # WHICH table 0 - 7 
#     table = []
#     kid_has_seat = false
#     tables_checked = 0

#     while (i < all_kids.length) do       
#       while (j <= number_of_groups - 1 )
#         if k < students_per_group # If the table isn't full, add the student to it. also add to fullness
#           kid = all_kids[i]  
#           # puts " i: student index = #{i} ////// j: table index = #{j} /////// k: table fullness = #{k}"
#           # puts kid.full_name
#           while (!kid_has_seat && (tables_checked <= number_of_groups - 1)) do
#             if !(kid.has_enemies_at_table(table))
#               table << kid
#               kid_has_seat = true
#               i += 1 
#               k += 1
#             else
#               j += 1
#             end
#           end


#           if kid_has_seat == false
#             ## ALERT TEACHER, unseatable
#           end

#         else # else if the table is full, go to the next table
#           j += 1
#           k = 0
#           tables_array << table
#           table = []
#         end
#       end 
#     end
#     tables_array
#   end

 # end


  def groups_of(students_per_group) #(5)
      number_of_groups = self.students.size / students_per_group  # 40 / 5 = 8
      tables_array = []#Array.new(number_of_groups, []) # [[],[],[],[],[],..]
      all_kids = students.to_a.shuffle
      empty_table = []
      unplaceable_kids = []

      
      all_kids.each do |kid|
        while empty_table.size < students_per_group do 
          if !((kid.has_enemies_at_table?(empty_table)) && empty_table.include?(kid))
            empty_table << all_kids.delete(kid)
          end
        end

      end
      tables_array << empty_table

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

class Student < ActiveRecord::Base
  has_many :student_course_sections
  has_many :course_sections, through: :student_course_sections
  has_many :course_teacher_assignments, through: :course_sections
  has_many :teachers, through: :course_teacher_assignments
  has_many :courses, through: :course_teacher_assignments
  has_many :enemyships
  has_many :enemies, through: :enemyships
  has_many :buddyships
  has_many :buddies, through: :buddyships
  has_many :guardians
  has_many :scores
  has_many :assignments, through: :course_sections
  has_many :memberships

  def full_name
    first_name + " " + last_name
  end
  
  def has_enemies_at_table?(table)
    enemies.each do |enemy|
      if table.include?(enemy)
        return true
      end
    end
    false
  end

  def has_buddies_at_table?(table)
    buddies.each do |buddy|
      if table.include?(buddy)
        return true
      end
    end
    false
  end

  def guardian_ids
    guardians.pluck(:id)
  end

  def is_overdue?(assignment)
    if assignment.students.include?(self) && (assignment.date_due != nil) && assignment.date_due < Date.today && score_for_assignment(assignment) == nil
      return true
    end
    false
  end

  def score_for_assignment(assignment)
    # binding.pry
    some_scores = Score.where(assignment_id: assignment.id, student_id: self.id)
    if !some_scores.empty?
      some_scores.first.points_earned
    end
  end

  def percent_score_for_assignment(assignment)
    if score_for_assignment(assignment) && assignment.points
      return (score_for_assignment(assignment).to_f / assignment.points) * 100
    end
  end

  def all_assignments_info
    assignment_score_hash = {}
    self.assignments.each do |assignment|
      assignment_score_hash[assignment.course_section.name] ||= []
      assignment_score_hash[assignment.course_section.name] << {
        name: assignment.name, 
        teacher: assignment.teacher.full_name, 
        date_assigned: assignment.date_assigned, 
        date_due: assignment.date_due, 
        points_score: score_for_assignment(assignment), 
        overdue: is_overdue?(assignment), 
        percent_score: percent_score_for_assignment(assignment), 
        max_points: assignment.points || "no max points set"
      }
    end
    assignment_score_hash
  end

  def percent_assignments_done_for_course(course_section)
    #binding.pry
    course_assignments = self.assignments.where(course_section_id: course_section.id)
    if !course_assignments.empty?
      scored_assignments_count = course_section.scores.where(student_id: self.id).count
      return scored_assignments_count / course_assignments.count.to_f * 100
    end
    return 0
  end

  def percent_assignments_done_overall
    all_assignments = self.assignments
    if !all_assignments.empty?
      scored_assignments_count = scores.where(student_id: self.id).count
      return scored_assignments_count / all_assignments.count.to_f * 100
    end
    return 0
  end

  def average_for_course(course_section)
    course_assignments_array = self.all_assignments_info[course_section.name]
    total_percentage_points = 0
    total_assignments_to_count = 0
    course_assignments_array.each do |assignment|
      if !assignment[:percent_score] && assignment[:overdue]
        total_assignments_to_count += 1
      elsif assignment[:percent_score]
        #binding.pry
        total_percentage_points += assignment[:percent_score]
        total_assignments_to_count += 1
      end
    end
    if total_assignments_to_count == 0
      return false
    elsif total_percentage_points == 0
      return 0
    else
      return total_percentage_points.to_f / total_assignments_to_count
    end
  end

  def overall_average
    courses_to_count = 0
    total_percentage_points = 0
    self.course_sections.each do |course_section|
      if average_for_course(course_section)
        courses_to_count += 1
        total_percentage_points += average_for_course(course_section)
      end
    end
    if courses_to_count == 0
      return false
    else
      return total_percentage_points / courses_to_count
    end
  end


end

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

  def full_name
    first_name + " " + last_name
  end

  def guardian_ids
    guardians.pluck(:id)
  end

  def is_overdue?(assignment)
    if !assignment.students.include?(self) || !assignment.date_due || assignment.date_due > Date.today || assignment.date_due < Date.today && score_for_assignment(assignment) != nil
    end
    true
  end

  def score_for_assignment(assignment)
    if !Score.where(assignment_id: assignment.id, student_id: self.id).empty?
      Score.where(assignment_id: assignment.id, student_id: self.id).first.points_earned
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
      assignment_score_hash[assignment.course_section.name] << {name: assignment.name, teacher: assignment.teacher.full_name, date_assigned: assignment.date_assigned, date_due: assignment.date_due, points_score: score_for_assignment(assignment), overdue: is_overdue?(assignment), percent_score: percent_score_for_assignment(assignment), max_points: assignment.points || "no max points set"}
    end
    assignment_score_hash
  end

  def overall_average
  end


end

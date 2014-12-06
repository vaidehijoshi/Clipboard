class Assignment < ActiveRecord::Base
  belongs_to :course_section
  delegate :teacher, to: :course_section
  has_many :students, through: :course_section
  has_many :scores
  accepts_nested_attributes_for :scores

  has_attached_file :document, styles: {thumbnail: {:geometry => "100x100", :quality => 400}, medium: "300x300", large: "600x600" }
  validates_attachment :document, content_type: { content_type: "application/pdf" }

  validates :name, presence: true

  def self.all_by_category(course_section)
    organized_hash = {}
    where(course_section_id: course_section.id).order(:category).each do |assignment|
      organized_hash[assignment.category] ||= []
      organized_hash[assignment.category] << assignment
    end
    organized_hash
  end

  def average_grade
    scores = Score.where(assignment_id: id)
    if scores.where("points_earned IS NOT NULL").empty?
      return "no scores yet!"
    end
    if !scores.empty?
      total = 0
      score_count = scores.count
      scores.each do |score|
        if score.points_earned
          total += score.points_earned.to_f / points * 100
        end
      end
    end
    if total == 0
      0
    else
      (total.to_f / score_count).round(2)
    end
  end

  def date_due_formatted
    if date_due
      date_due.strftime('%m/%d/%Y')
    else
      "no due date set"
    end
  end

  def date_assigned_formatted
    if date_assigned
      date_assigned.strftime('%m/%d/%Y')
    else
      "no date assigned set"
    end
  end
end

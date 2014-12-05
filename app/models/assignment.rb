class Assignment < ActiveRecord::Base
  belongs_to :course_section
  has_many :students, through: :course_section
  has_many :scores
  accepts_nested_attributes_for :scores

  has_attached_file :document, styles: {thumbnail: {:geometry => "100x100", :quality => 400}, medium: "300x300" }
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

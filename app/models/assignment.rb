class Assignment < ActiveRecord::Base
  belongs_to :course_section
  has_many :scores

  validates :name, presence: true

  def self.all_by_category(course_section)
    organized_hash = {}
    where(course_section_id: course_section.id).order(:category).each do |assignment|
      organized_hash[assignment.category] ||= []
      organized_hash[assignment.category] << assignment
    end
    organized_hash
  end
end

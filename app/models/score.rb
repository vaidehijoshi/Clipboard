class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  delegate :course_section, to: :assignment

  validate :points_earned, presence: true
end

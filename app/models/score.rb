class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  delegate :course_section, to: :assignment

  validates_uniqueness_of :assignment, scope: :student
  validates :points_earned, presence: true
  validate :points_not_more_than_possible

  def points_not_more_than_possible
    if points_earned && assignment.points
      if points_earned > assignment.points
        errors.add(:points_earned, "points can't be more than the possible points")
      end
    end
  end

end

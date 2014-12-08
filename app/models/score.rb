class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  delegate :course_section, to: :assignment

  validates_uniqueness_of :assignment, scope: :student
  validates :points_earned, presence: true
  validate :points_not_more_than_possible

  def color_class
    if destroyed?
      ""
    elsif points_earned
      ratio = points_earned / assignment.points.to_f
      case
      when ratio >= 0.9
        "info"
      when ratio >= 0.8
        "success"
      when ratio >= 0.7
        "warning"
      when ratio < 0.7
        "danger"
      # when ratio < 0.6
      #   "active"
      end
    end
  end


  private
  def points_not_more_than_possible
    if points_earned && assignment.points
      if points_earned > assignment.points
        errors.add(:points_earned, "points can't be more than the possible points")
      end
    end
  end

end

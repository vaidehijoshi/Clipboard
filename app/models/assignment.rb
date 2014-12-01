class Assignment < ActiveRecord::Base
  belongs_to :section
  delegate :subject, to: :section
  delegate :teacher, to: :subject
  has_many :grades

  validates :name, presence: true

  def score
    # calculate the percentage based on points_earned / total_points
  end

end

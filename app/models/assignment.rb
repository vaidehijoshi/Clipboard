class Assignment < ActiveRecord::Base
  belongs_to :course_section

  validates :name, presence: true
end

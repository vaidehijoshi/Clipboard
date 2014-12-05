class Group < ActiveRecord::Base
  belongs_to :course_section
  has_many :memberships
  has_many :students, through: :memberships
end

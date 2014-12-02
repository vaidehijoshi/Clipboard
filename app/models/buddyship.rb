class Buddyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :buddy, class_name: 'Student', foreign_key: 'buddy_id'
  belongs_to :course_section
end

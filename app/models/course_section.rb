class CourseSection < ActiveRecord::Base
  has_many :buddyships
  has_many :enemyships
end

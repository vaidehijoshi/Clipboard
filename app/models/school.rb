class School < ActiveRecord::Base
  has_many :teachers
  has_many :courses
  
  validates :name, presence: true
end

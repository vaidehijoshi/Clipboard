class Teacher < ActiveRecord::Base
  has_many :subjects
  has_many :sections, through: :subjects
  has_many :assignments, through: :sections
  has_many :students, through: :sections
  has_many :guardians, through: :students

  validates :first_name, :last_name, presence: true

end
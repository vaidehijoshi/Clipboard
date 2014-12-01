class Section < ActiveRecord::Base
  belongs_to :subject
  delegate :teacher, to: :subject

  has_many :assignmments
  has_many :grades, through: :assignments
  has_many :section_students
  has_many :students, through: :section_students
  has_many :guardians, through: :students
  has_many :absences
  has_many :tardies

  validates :name, presence: true

end

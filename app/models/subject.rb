class Subject < ActiveRecord::Base
  belongs_to :teacher
  has_many :sections
  has_many :students, through: :sections
  has_many :assignments, through: :sections

  validates :name, presence: true

end

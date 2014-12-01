class Guardian < ActiveRecord::Base
  belongs_to :student
  has_many :teachers, through: :student

  validates :first_name, :last_name, presence: true
  
end

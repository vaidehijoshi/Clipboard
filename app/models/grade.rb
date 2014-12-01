class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  delegate :section, to: :assignment
  delegate :subject, to: :section
  delegate :teacher, to: :subject

end

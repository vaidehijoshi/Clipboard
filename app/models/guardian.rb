class Guardian < ActiveRecord::Base
  belongs_to :student
  validates_presence_of :first_name, :last_name, :relationship

  def full_name
    "#{title} #{first_name} #{last_name}"
  end

  def name_with_relationship
    "#{relationship}: #{full_name}"
  end
end

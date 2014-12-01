class Tardy < ActiveRecord::Base
  belongs_to :section
  belongs_to :student
  
end

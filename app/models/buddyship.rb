class Buddyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :buddy, class_name: "Student", foreign_key: "buddy_id"
  
  # validate :is_not_duplicate, :on => :create
  # validate :no_self_buddying, :on => :create
  # validates :buddy_one, :buddy_two, presence: true

  # def is_not_duplicate
  #   if WorkBuddy.where(:buddy_one_id => buddy_one_id, :buddy_two_id => buddy_two_id).any? || WorkBuddy.where(:buddy_one_id => buddy_two_id, :buddy_two_id => buddy_one_id).any?
  #     errors.add(:work_buddy, "This relationship already exists!")
  #   end
  # end

  # def no_self_buddying
  #   if buddy_one_id == buddy_two_id
  #     errors.add("Hey man a student can't be their own buddy!")
  #   end
  # end

end

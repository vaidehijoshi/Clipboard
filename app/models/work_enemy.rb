class WorkEnemy < ActiveRecord::Base
  belongs_to :enemy_one, class_name: "Student", foreign_key: "enemy_one_id"
  belongs_to :enemy_two, class_name: "Student", foreign_key: "enemy_two_id"

  validate :is_not_duplicate, :on => :create
  validate :no_self_enemying, :on => :create
  validates :enemy_one, :enemy_two, presence: true

  def is_not_duplicate
    if WorkEnemy.where(:enemy_one_id => enemy_one_id, :enemy_two_id => enemy_two_id).any? || WorkEnemy.where(:enemy_one_id => enemy_two_id, :enemy_two_id => enemy_one_id).any?
      errors.add(:work_enemy, "This relationship already exists!")
    end
  end

  def no_self_enemying
    if enemy_one_id == enemy_two_id
      errors.add("Hey man a student can't be their own enemy!")
    end
  end


end

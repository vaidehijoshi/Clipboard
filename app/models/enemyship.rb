class Enemyship < ActiveRecord::Base
  belongs_to :student
  belongs_to :enemy, class_name: 'Student', foreign_key: 'enemy_id'
  belongs_to :course_section
end

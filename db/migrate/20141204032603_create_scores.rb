class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :assignment_id
      t.integer :student_id
      t.integer :points_earned
      t.timestamps
    end
  end
end

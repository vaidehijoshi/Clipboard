class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.integer :points_earned

      t.timestamps
    end
  end
end

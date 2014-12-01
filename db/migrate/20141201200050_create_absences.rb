class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.integer :student_id
      t.integer :section_id
      t.datetime :date
      t.boolean :excused, :default => false
      t.string :comments
      
      t.timestamps
    end
  end
end

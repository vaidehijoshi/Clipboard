class CreateBuddyships < ActiveRecord::Migration
  def change
    create_table :buddyships do |t|
      t.integer :student_id
      t.integer :buddy_id
      t.timestamps
    end
  end
end

class CreateWorkBuddies < ActiveRecord::Migration
  def change
    create_table :work_buddies do |t|
      t.integer :buddy_one_id
      t.integer :buddy_two_id
      t.string :comments
    end
  end
end

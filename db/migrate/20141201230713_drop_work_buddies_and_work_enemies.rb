class DropWorkBuddiesAndWorkEnemies < ActiveRecord::Migration
  def change
    drop_table :work_buddies
    drop_table :work_enemies
  end
end

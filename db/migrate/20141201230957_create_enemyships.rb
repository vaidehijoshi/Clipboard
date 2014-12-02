class CreateEnemyships < ActiveRecord::Migration
  def change
    create_table :enemyships do |t|
      t.integer :student_id
      t.integer :enemy_id
      t.timestamps
    end
  end
end

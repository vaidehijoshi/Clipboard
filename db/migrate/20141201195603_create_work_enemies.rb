class CreateWorkEnemies < ActiveRecord::Migration
  def change
    create_table :work_enemies do |t|
      t.integer :enemy_one_id
      t.integer :enemy_two_id
      t.string :comments
      t.timestamps
    end
  end
end

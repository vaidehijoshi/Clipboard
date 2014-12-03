class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.integer :student_id
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :address
      t.string :email
      t.string :day_phone
      t.string :evening_phone
      t.string :relationship

      t.timestamps
    end
  end
end

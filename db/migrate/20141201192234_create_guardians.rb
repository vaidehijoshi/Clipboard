class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :day_phone
      t.string :evening_phone
      t.string :address
      t.string :relationship
      t.boolean :primary_contact
      t.integer :student_id
      t.timestamps
    end
  end
end

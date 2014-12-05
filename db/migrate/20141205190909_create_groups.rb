class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :course_section, index: true

      t.timestamps
    end
  end
end

class ChangeTypeToCategoryInAssignments < ActiveRecord::Migration
  def change
    rename_column :assignments, :type, :category
  end
end

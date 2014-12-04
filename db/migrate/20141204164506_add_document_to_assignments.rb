class AddDocumentToAssignments < ActiveRecord::Migration
  def change
    add_attachment :assignments, :document
  end
end

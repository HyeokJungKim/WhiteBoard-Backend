class AddAttachmentPdfToAssignments < ActiveRecord::Migration[5.2]
  def self.up
    change_table :assignments do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :assignments, :pdf
  end
end

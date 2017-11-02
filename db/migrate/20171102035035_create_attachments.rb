class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.integer :attachmentable_id
      t.string :attachmentable_type
      t.string :attachment
      t.timestamps
    end
  end
end

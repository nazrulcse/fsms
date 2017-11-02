class CreateChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.string :title
      t.string :item_type
      t.text :options
      t.integer :survey_id

      t.timestamps
    end
  end
end

class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :title
      t.text :address
      t.integer :zone_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

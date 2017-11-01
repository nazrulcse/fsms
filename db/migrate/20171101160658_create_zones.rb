class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.string :title
      t.text :address
      t.string :code

      t.timestamps
    end
  end
end

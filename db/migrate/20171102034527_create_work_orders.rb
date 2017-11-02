class CreateWorkOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :work_orders do |t|
      t.integer :site_id
      t.integer :survey_id
      t.integer :technician_id
      t.integer :creator
      t.string :title
      t.string :status
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :submitted, default: false
      t.boolean :assigned, default: false
      t.timestamps
    end
  end
end

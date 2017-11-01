class AddMoreFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :department_id, :integer
    add_column :users, :zone_id, :integer
    add_column :users, :site_id, :integer
  end
end

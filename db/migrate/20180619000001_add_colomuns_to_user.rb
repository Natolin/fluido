class AddColomunsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :teacher_status, :boolean, default: false
    add_column :users, :description, :text
    add_column :users, :average_rating, :float
    add_column :users, :country, :string
    add_column :users, :photo, :string
  end
end

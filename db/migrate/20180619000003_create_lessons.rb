class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.text :description
      t.integer :price
      t.references :languages, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

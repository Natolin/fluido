class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :total_price
      t.string :status, default: "pending"
      t.integer :rating
      t.references :user, foreign_key: true
      # t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end

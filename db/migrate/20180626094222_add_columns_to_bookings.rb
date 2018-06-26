class AddColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start_date, :datetime
    remove_column :bookings, :end_date, :datetime

    add_column :bookings, :start_date, :date
    add_column :bookings, :start_time, :time
    add_column :bookings, :end_time, :time
  end
end

class DashboardsController < ApplicationController
  def dashboard
    @my_bookings = current_user.bookings
    @my_lessons = current_user.lessons
    bookings = Booking.all
    @my_classes = bookings.select{ |booking| booking.lesson.user_id == current_user.id }
  end
end

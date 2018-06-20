class DashboardsController < ApplicationController
  def dashboard
    @my_bookings = current_user.bookings
    @my_lessons = current_user.lessons
  end
end

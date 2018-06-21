class BookingsController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @lesson = Lesson.find(params[:lesson_id])
    @booking.lesson = @lesson
    @booking.user = current_user
    if @booking.save
      flash[:success] = "Your booking has been successfully created!"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @lesson = Lesson.find(params[:lesson_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @lesson = Lesson.find(params[:lesson_id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end


  def destroy
    @booking = Booking.find(params[:id])
    @lesson = Lesson.find(params[:lesson_id])
    @booking.destroy
    redirect_to dashboard_path
  end
  # def update_state
  #   @booking = Booking.find(params[:id])

  #   @booking.change_status(params[:status])
  #   @booking.save
  #   redirect_to dashboard_path
  # end

private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :lesson_id, :user_id, :total_price, :rating, :status)
  end
end

class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end


  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end


  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:description, :price, :language_id, :user_id )
  end
end

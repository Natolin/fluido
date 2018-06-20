class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end


  def destroy
  end


  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end

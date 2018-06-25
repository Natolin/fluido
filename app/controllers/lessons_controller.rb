class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    query = params[:query]
    @lessons = Lesson.all

    if query

      # Language

      if query[:language] == "All"
        @lessons
      elsif query[:language] != ""
        @lessons = @lessons.search_by_language(query[:language])
      end

      # Interests

      if query[:interest] != ""
        @lessons = @lessons.search_by_interests(query[:interest])
      end

      # Price

      if query[:price] != "" # Not nil otherwise other search fields wont work
        price = query[:price]
        if price != "20+"
          @lessons = @lessons.where(price: 1..price.to_i)
        else
          @lessons = @lessons.where.not(price: 1..price.to_i)
        end
      end

      # Country

      if query[:country] != "Country"
        @lessons = @lessons.search_by_country(query[:country])
      end

      # Teacher Name

      if query[:teacher_name] != ""
        @lessons = @lessons.search_by_teacher_name(query[:teacher_name])
      end


    end
  end

  def show
    @conversation = Conversation.new
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

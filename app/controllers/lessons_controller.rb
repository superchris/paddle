class LessonsController < ApplicationController
  def index
    @lessons = Lesson.paginate(page: params[:page], per_page: 5)
  end

  def new
    @lesson = Lesson.new
  end

  def create
   Lesson.create(lesson_params)
   redirect_to root_path
  end

 private

  def lesson_params
   params.require(:lesson).permit(:name, :description, :date, :time, :location, :address)
  end
end

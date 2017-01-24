class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @lessons = Lesson.paginate(page: params[:page], per_page: 5)
  end

  def new
    @lesson = Lesson.new
  end

  def create
   current_user.lessons.create(lesson_params)
   redirect_to root_path
  end

 private

  def lesson_params
   params.require(:lesson).permit(:name, :description, :date, :time, :location, :address)
  end
end

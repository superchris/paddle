class LessonsController < ApplicationController
  def index
    @lessons = Lesson.paginate(page: params[:page], per_page: 5)
  end

  def new
    @lesson = Lesson.new
  end
end

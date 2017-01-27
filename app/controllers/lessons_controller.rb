class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @lessons = Lesson.paginate(page: params[:page], per_page: 5)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = current_user.lessons.create(lesson_params)
    if @lesson.valid?
     redirect_to root_path
    else
     render :new, status: :unprocessable_entity
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
     @lesson = Lesson.find(params[:id])

     if @lesson.user != current_user
       return render text: 'Not Allowed', status: :forbidden
     end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @lesson.update_attributes(lesson_params)
    if @lesson.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @lesson.destroy
    redirect_to root_path
  end

 private

  def lesson_params
   params.require(:lesson).permit(:name, :description, :date, :time, :location, :address)
  end
end

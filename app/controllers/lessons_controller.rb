class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
    @lessons = Lesson.order("created_at DESC").paginate(page: params[:page], per_page: 5)
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
    @comment = Comment.new
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
    params.require(:lesson).permit(:name, :description, :date, :time, :location, :address, :max_students)
  end

  # def require_admin
  #   if current_user != current_user && current_user.admin
  #     flash[:danger] = "Only instructors can create new lessons"
  #     redirect_to root_path
  #   end
  # end
end

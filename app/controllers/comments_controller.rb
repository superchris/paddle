class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.comments.create(comment_params.merge(user: current_user))
    redirect_to lesson_path(@lesson)
  end

  private

   def comment_params
     params.require(:comment).permit(:full_name, :phone_number, :email, :skill_level, :message)
   end
end

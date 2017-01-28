class NotificationMailer < ActionMailer::Base
  default from: "no-reply@losantivilletennisandpaddle.com"

  def comment_added(comment)
    @lesson = comment.lesson
    @lesson_owner = @lesson.user
    mail(to: @lesson_owner.email,
         subject: "Someone signed up for your lesson #{@lesson.name}!")
  end
end

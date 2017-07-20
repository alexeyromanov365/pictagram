class UserMailer < ApplicationMailer
  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: "#{@user.first_name.capitalize}, Welcome to Pictagram!")
  end
end

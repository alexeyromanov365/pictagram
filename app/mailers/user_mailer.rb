class UserMailer < ApplicationMailer
  def notify_user(user, follower)
    mail(to: user.email, subject: "#{follower.first_name.capitalize} #{follower.last_name.capitalize}, now follow you")
  end
end

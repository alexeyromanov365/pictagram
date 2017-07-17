class Notifications::FollowNotification < Notifications::AbstractNotification
  def initialize(followership, current_user)
    @receiver = followership
    @sender = current_user
  end

  def notify
    return if receiver == sender
    NotificationChannel.broadcast_to(receiver, {
        icon: sender.avatar.url,
        name: sender.first_name + " " + sender.last_name,
        text: 'Now follow you'
    })
  end
end
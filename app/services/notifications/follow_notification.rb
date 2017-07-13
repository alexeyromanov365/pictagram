class Notifications::FollowNotification < Notifications::AbstractNotification
  def initialize(followership)
    @receiver = User.find(followership.followed_id)
    @sender = User.find(followership.follower_id)
    @followership = followership
  end

  def notify
    return if receiver == sender
    NotificationChannel.broadcast_to(receiver, {
        icon: sender.avatar.url,
        name: sender.first_name + " " + sender.last_name,
        text: 'Now follow you',
    })
  end

  private

  attr_reader :comment
end
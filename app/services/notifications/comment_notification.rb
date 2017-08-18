class Notifications::CommentNotification < Notifications::AbstractNotification
  def initialize(comment)
    @receiver = comment.photo.album.user
    @sender = comment.user
  end

  def notify
    return if receiver == sender
    NotificationChannel.broadcast_to(receiver, {
        icon: sender.avatar.url,
        name: sender.first_name + " " + sender.last_name,
        text: 'Comment your photo',
    })
  end
end

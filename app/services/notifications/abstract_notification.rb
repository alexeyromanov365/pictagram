class Notifications::AbstractNotification
  include Rails.application.routes.url_helpers

  def notify
    raise NotImplementedError
  end

  attr_reader :sender, :receiver
end

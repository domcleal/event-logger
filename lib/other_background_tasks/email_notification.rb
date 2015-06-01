class OtherBackgroundTasks::EmailNotification

  @queue = "email.notification"

  def self.perform(user_notification_id)
    user_notification = UserNotification.find(user_notification_id)
    Rails.logger.info "Sending email user notification #{user_notification_id} to #{user_notification.user.email}..."
    NotificationsMailer.notification_email(user_notification).deliver
    Rails.logger.info "Done."
  end

end
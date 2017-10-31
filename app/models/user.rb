class User < ApplicationRecord
  has_and_belongs_to_many :books
  has_many :sent_notifications, :class_name => 'Notification',:foreign_key => 'sender_id'
  has_many :received_notifications, :class_name => 'Notification',:foreign_key => 'recipient_id'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def add_book_request(book,current_user)
    begin
      notification = Notification.book_request_notification(book,current_user,self)
      notification.save
      self.received_notifications << notification
      return "request sent",201
    rescue
      return "request submission failed",400
    end
  end
end

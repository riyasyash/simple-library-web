class Notification < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'


  def self.book_request_notification(book,current_user,user)
    book_request_message = "Hey I would like to borrow this book :) - #{book.title}"
    return Notification.new(message:book_request_message,sender_id:current_user.id,recipient_id:user.id)
  end
end

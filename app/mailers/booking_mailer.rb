class BookingMailer < ApplicationMailer
  def successful(booking, subject)
    user = User.find_by_id(booking.user_id)
    email = user.email if user
    email ||= booking.anon_email
    mail(to: email, subject: subject)
  end
end

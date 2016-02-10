class BookingMailer < ApplicationMailer
  def successful(booking, subject)
    @booking = booking
    @user = User.find_by_id(booking.user_id)
    email = @user.email if @user
    email ||= booking.anon_email
    mail(to: email, subject: subject)
  end

  def update(booking, subject)
    @booking = booking
    @user = User.find_by_id(booking.user_id)
    mail(to: @user.email, subject: subject)
  end
end

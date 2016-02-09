class BookingMailer < ApplicationMailer
  def successful(booking, subject)
    @booking = booking
    @user = User.find_by_id(booking.user_id)
    if @user
      email = @user.email
      @username = @user.username
    else
      email ||= booking.anon_email
      @username = "Customer"
    end
    mail(to: email, subject: subject)
  end

  def update(booking, subject)
    @booking = booking
    @user = User.find_by_id(booking.user_id)
    mail(to: @user.email, subject: subject)
  end
end

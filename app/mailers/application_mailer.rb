class ApplicationMailer < ActionMailer::Base
  default from: "<noreply@bon-voyage.herokuapp.com>"
  layout "mailer"
end

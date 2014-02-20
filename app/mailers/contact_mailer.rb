class ContactMailer < ActionMailer::Base
  default from: "work.ducrouxolivier@gmail.com"
  default to: "work.ducrouxolivier@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mailer.subject
  #
  def send_mail(message)
    @message = message
    mail(:subject => "hh")
  end
end

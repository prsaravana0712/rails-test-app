class WelcomeMailer < ApplicationMailer
  def welcome_email
    @customer = params[:customer]

    mail(from: "saravanakumar.r@spritle.com", to: @customer.email, subject: "Welcome to Action Mailer")
  end
end

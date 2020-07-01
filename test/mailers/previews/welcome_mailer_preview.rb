# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  def welcome_email
    # Set up a temporary order for the preview
    customer = Customer.new(name: "Saravanakumar Raju", email: "saravanakumar.r@spritle.com", mobile: "9584555446", city: "Chennai")

    WelcomeMailer.with(customer: customer).welcome_email
  end
end

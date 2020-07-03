module MyConcern
  extend ActiveSupport::Concern

  def email_notification(customer)
    WelcomeMailer.with(customer: customer).welcome_email.deliver_later
  end
  
end
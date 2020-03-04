# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class InvestorMailerPreview < ActionMailer::Preview
  def send_newsletter_preview
    InvestorMailer.send_newsletter(User.first)
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/investor_mailer/send_newsletter_preview.html
class InvestorMailerPreview < ActionMailer::Preview
  def send_newsletter_preview
    InvestorMailer.send_newsletter(Newsletter.first, User.first)
  end
end

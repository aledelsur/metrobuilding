class InvestorMailer < ApplicationMailer
  def send_newsletter(sent_newsletter)
    @sent_newsletter = sent_newsletter
    @user = sent_newsletter.user

    mail(
      to: @user.email,
      subject: 'Tu nueva Circular de Metrobuilding'
    )
  end
end

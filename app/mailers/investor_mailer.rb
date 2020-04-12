class InvestorMailer < ApplicationMailer
  def send_newsletter(newsletter, user)
    @newsletter = newsletter
    @user = user
    mail(
      to: @user.email,
      subject: 'Tu nueva Circular de Metrobuilding'
    )
  end
end

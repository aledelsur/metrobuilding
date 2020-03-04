class InvestorMailer < ApplicationMailer
  def send_newsletter(user)
    @user = user
    mail(
      to: @user.email,
      subject: 'Tu nueva Circular de Metrobuilding'
    )
  end

end

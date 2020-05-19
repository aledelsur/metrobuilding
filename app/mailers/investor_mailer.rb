class InvestorMailer < ApplicationMailer
  def send_newsletter(sent_newsletter)
    apply_smtp_settings_for_project(sent_newsletter.project)
    apply_url_host(sent_newsletter.project)

    @sent_newsletter = sent_newsletter
    @user = sent_newsletter.user

    mail(
      to: @user.email,
      subject: "Tu nueva Circular de #{sent_newsletter.project.name.humanize}"
    )
  end
end

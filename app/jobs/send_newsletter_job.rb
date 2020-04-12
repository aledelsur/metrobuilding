class SendNewsletterJob < ApplicationJob
  queue_as :default

  def perform(newsletter)
    users = User.all
    users.each do |user|
      # Sends email to investor with a link to the newsletter.
      InvestorMailer.send_newsletter(newsletter, user).deliver
    end
  end

end

class SendNewsletterJob < ApplicationJob
  queue_as :default

  def perform(newsletter_id, selected_option, user_ids)
    newsletter = Newsletter.find(newsletter_id)

    case selected_option
    when 'all_users'
      send_email_to_all_users_in_system(newsletter)
    when 'some_users'
      send_email_to_specific_users(newsletter, user_ids)
    end
  end

  def send_email_to_all_users_in_system(newsletter)
    users = User.all

    users.each do |user|
      # Sends email to investor with a link to the newsletter.
      InvestorMailer.send_newsletter(newsletter, user).deliver
    end
  end

  def send_email_to_specific_users(newsletter, user_ids)
    ids = user_ids.first.split(',') # from ["72,73"] to ["72", "73"]
    users = User.where(id: ids)

    users.each do |user|
      # Sends email to investor with a link to the newsletter.
      InvestorMailer.send_newsletter(newsletter, user).deliver
    end
  end
end

class SendNewsletterJob < ApplicationJob
  queue_as :default

  def perform(newsletter_id, selected_option, user_ids, company_id, group_ids)
    newsletter = Newsletter.find(newsletter_id)

    case selected_option
    when 'all_users'
      send_email_to_all_users_in_system(newsletter, company_id)
    when 'some_users'
      send_email_to_specific_users(newsletter, user_ids, company_id)
    when 'some_groups'
      send_email_to_specific_groups(newsletter, group_ids)
    end
  end

  def send_email_to_all_users_in_system(newsletter, company_id)
    company = Company.find(company_id)
    users   = company.users

    send_newsletters(newsletter, users)
  end

  def send_email_to_specific_users(newsletter, user_ids, company_id)
    company = Company.find(company_id)

    ids = user_ids.first.split(',') # from ["72,73"] to ["72", "73"]
    users = company.users.where(id: ids)

    send_newsletters(newsletter, users)
  end

  def send_email_to_specific_groups(newsletter, group_ids)
    ids = group_ids.first.split(',') # from ["7,6"] to ["7", "6"]
    groups = Group.where(id: ids)

    send_newsletters_to_groups(newsletter, groups)
  end

  def send_newsletters(newsletter, users)
    users.each do |user|
      newsletter_variable = NewsletterVariable.new(user, newsletter)

      sent_newsletter = user.sent_newsletters.create(newsletter: newsletter,
                                                     newsletter_variables: newsletter_variable.variables_to_replace,
                                                     company_id: newsletter.company_id,
                                                     project_id: newsletter.project_id)

      # Sends email to investor with a link to the newsletter.
      InvestorMailer.send_newsletter(sent_newsletter).deliver
    end
  end

  def send_newsletters_to_groups(newsletter, groups)
    groups.each do |group|
      users_in_group = group.users
      users_in_group.each do |user|
        newsletter_variable = NewsletterVariable.new(user, newsletter)

        sent_newsletter = user.sent_newsletters.create(newsletter: newsletter,
                                                       newsletter_variables: newsletter_variable.variables_to_replace,
                                                       company_id: newsletter.company_id,
                                                       project_id: newsletter.project_id)

        # Sends email to investor with a link to the newsletter.
        InvestorMailer.send_newsletter(sent_newsletter).deliver
      end
    end
  end
end

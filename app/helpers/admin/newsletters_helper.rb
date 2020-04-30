module Admin::NewslettersHelper
  def index_newsletter_sent(newsletter)
    if newsletter.sent_at.blank?
      '-'
    else
      newsletter.sent_at&.strftime("%d-%m-%Y a las %H:%M hs.")
    end
  end

  def has_been_sent?(newsletter)
    newsletter.sent_at.present?
  end
end

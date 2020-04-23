class Site::SentNewslettersController < ApplicationController
  def show
    @sent_newsletter = SentNewsletter.find_by(sent_newsletter_token: params[:sent_newsletter_token])
  end

  # def view_newsletter
  #   sent_newsletter = SentNewsletter.find_by(guid: params[:guid])
  #   newsletter = sent_newsletter.newsletter
  #   byebug
  #   render json: newsletter, serializer: ::Admin::NewsletterPreviewSerializer
  # end
end
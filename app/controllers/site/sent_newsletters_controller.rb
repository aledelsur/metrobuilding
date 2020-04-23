class Site::SentNewslettersController < ApplicationController
  layout 'newsletter_show'

  def show
    @sent_newsletter = SentNewsletter.find_by(sent_newsletter_token: params[:id])

    respond_to do |format|
      format.json { render json: @sent_newsletter.newsletter, serializer: Site::NewsletterSerializer, scope: { sent_newsletter_id: @sent_newsletter.id } }
      format.html { render :show, layout: 'newsletter_show' }
    end
  end
end
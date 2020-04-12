module Admin::MediaAssetsHelper

  def used_in_newsletter?(asset)
    if asset.newsletter_sections.any?
      "<div class='label label-info'>Imagen utilizada en circular</div>".html_safe
    else
      "<b>No</b>".html_safe
    end
  end
end
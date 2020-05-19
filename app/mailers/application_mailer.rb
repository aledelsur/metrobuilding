class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def apply_smtp_settings_for_project(project)
    ActionMailer::Base.smtp_settings.merge!(project.smtp_settings)
  end

  def apply_url_host(project)
    ActionMailer::Base.default_url_options = { host: "#{project.name}.buildit.com.ar" }
  end
end

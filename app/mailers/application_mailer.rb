class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def apply_smtp_settings_for_project(project)
    ActionMailer::Base.smtp_settings.merge!(project.smtp_settings)
  end
end

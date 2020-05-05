class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def apply_smtp_settings_for_project(project)
    ActionMailer::Base.smtp_settings.merge!({
      address:      project.smtp_settings_address,
      port:         project.smtp_settings_port,
      domain:       project.smtp_settings_domain,
      user_name:    project.smtp_settings_user_name,
      password:     project.smtp_settings_password,
    })
  end
end

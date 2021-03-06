class ApplicationController < ActionController::Base
  before_action  :get_project, :set_project

  private

  def get_project
    subdomain
    @project ||= Project.find_by(name: @subdomain)

    puts "##### THE SUBDOMAIN IS "
    puts @subdomain

    render_doesnt_exist_page and return false unless @project

    @company = @project.company

    if (current_user && current_user.company_id != @project.company_id) || (current_admin_user && current_admin_user.company_id != @project.company_id)
      redirect_to root_path, status: :forbidden and return
    end
  end

  def set_project
    User.current_project = @project
  end

  def subdomain
    sub = self.request.subdomain
    sub.split('.').first
    @subdomain = sub.split('.').first
  end

  def http_host
    subdomain + configatron.http_domain
  end

  def render_doesnt_exist_page
    render template: 'signup/doesnt_exist'
  end
end

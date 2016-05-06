class ProjectsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access

  def index
    load_projects
    render_json(@projects)
  end

  def show
    load_project
    render_json(@project)
  end

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  def load_projects
    @projects ||= project_scope
  end

  def load_project
    @project ||= project_scope.find(params[:id])
  end

  def render_json(var)
    render json: var, status: 200
  end

  def project_scope
    Project.all
  end
end

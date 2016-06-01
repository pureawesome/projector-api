class ResourcesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :restrict_access
  def index
    load_resources
    render_json(@resources)
  end

  private

  def load_projects
    @resources ||= resource_scope
  end

  def render_json(var)
    render json: var, status: 200
  end

  def resource_scope
    Resource.all
  end
end

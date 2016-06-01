class ProjectsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :restrict_access

  def index
    load_projects
    render_json(@projects)
  end

  def show
    load_project
    render_json(@project)
  end

  def create
    build_project
    save_project or render 'new'
  end

  def update
    load_project
    build_project
    update_project or render 'edit'
  end

  def destroy
    load_project
    delete_project
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

  def build_project
    @project ||= project_scope.build
    @project.attributes = project_params
  end

  def save_project
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update_project
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def delete_project
    @project.destroy
  end

  def project_params
    project_params ||= params[:project]
    project_params ? project_params.permit(:name, :description, :start_date, :projected_end_date, :budget) : {}
  end

  def render_json(var)
    render json: var, status: 200
  end

  def project_scope
    Project.all
  end
end

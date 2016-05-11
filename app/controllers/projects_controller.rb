class ProjectsController < ApplicationController
  def index
    load_projects
    render_json(@projects)
  end

  def show
    load_project
    render_json(@project)
  end

  private

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

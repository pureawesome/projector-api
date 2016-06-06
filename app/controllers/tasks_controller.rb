class TasksController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_request!

  def show
    load_task
    render_json(@task)
  end

  private

  def load_task
    @task ||= task_scope.find(params[:id])
  end

  def render_json(var)
    render json: var, status: 200
  end

  def task_scope
    Task.all
  end
end

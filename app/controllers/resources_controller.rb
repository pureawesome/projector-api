class ResourcesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_request!

  def index
    load_resources
    render_json(@resources)
  end

  def show
    load_resource
    load_booking
    render_json({resource: @resource, bookings: @bookings})
  end

  def update
    load_resource
    build_resource
    update_resource or render 'edit'
  end

  def create
    build_resource
    save_resource or render 'new'
  end

  def destroy
    load_resource
    delete_resource
  end

  private

  def load_resources
    @resources ||= resource_scope
  end

  def load_resource
    @resource ||= resource_scope.find(params[:id])
  end

  def load_booking
    @bookings = @resource.bookings
  end

  def build_resource
    @resource ||= resource_scope.build
    @resource.attributes = resource_params
  end

  def update_resource
    if @resource.update(resource_params)
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def save_resource
    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def delete_resource
    @resource.destroy
  end

  def render_json(var)
    render json: var, status: 200
  end

  def resource_params
    resource_params ||= params[:resource]
    resource_params ? resource_params.permit(:name, :description) : {}
  end

  def resource_scope
    Resource.all
  end
end

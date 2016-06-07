class BookingsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_request!

  def show
    load_booking
    load_project
    load_resource
    render_json({ :booking => @booking, :project => @project, :resource => @resource })
  end

  private

  def load_booking
    @booking ||= booking_scope.find(params[:id])
  end

  def load_project
    @project = @booking.project
  end

  def load_resource
    @resource = @booking.resource
  end

  def render_json(var)
    render json: var, status: 200
  end

  def booking_scope
    Booking.all
  end
end

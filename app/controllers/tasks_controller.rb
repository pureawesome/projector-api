class TasksController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :restrict_access

end

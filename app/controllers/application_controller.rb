class AccessDeniedError < StandardError
end

class AuthenticationFailureError < StandardError
end

class AuthenticationTimeoutError < StandardError
end

class ApplicationController < ActionController::API
  attr_reader :current_user

  rescue_from AuthenticationTimeoutError, with: :authentication_timout
  rescue_from AuthenticationFailureError, with: :AuthenticationFailureError

  protected
  def authenticate_request!
    fail AuthenticationFailureError unless user_id_included_in_auth_token?
    @current_user = User.find(decoded_auth_token[:user_id])
  rescue JWT::ExpiredSignature
    raise AuthenticationTimeoutError
  rescue JWT::VerificationError, JWT::DecodeError

    raise AuthenticationFailureError
  end

  private
  def user_id_included_in_auth_token?
    http_auth_token && decoded_auth_token && decoded_auth_token[:user_id]
  end

  def http_auth_token
    @http_auth_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def decoded_auth_token
    @decoded_auth_token ||= AuthToken.decode(http_auth_token)
  end

  def authentication_timout
    render json: { errors: ['Authentication Timeout'] }, status: 419
  end

  def forbidden_resource
    render json: { errors: ['Access Denied To Resource'] }, status: 403
  end

  def authentication_failure
    render json: { errors: ['Authentication Failed'] }, status: 401
  end
end

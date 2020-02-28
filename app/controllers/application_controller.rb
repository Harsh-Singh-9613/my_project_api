class ApplicationController < ActionController::API

  before_filter :authenticate  
  def authenticate
    render json: {errors: 'Unauthorized'}, status: 401 unless current_user
  end

  def current_user
    @current_user ||= Jwt::UserAuthenticator.(request.headers)
  end
end

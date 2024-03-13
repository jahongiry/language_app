class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    begin
      @decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
      @current_user = User.find(@decoded_token[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :unauthorized
    end
  end
end

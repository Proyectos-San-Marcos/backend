class ApplicationController < ActionController::API
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_founded

  def route_not_founded
    render json: { error: 'This route not exist.' }, status: :not_found
  end

  protected

  def user_not_authorized(exception)
    render json: { error: exception.message }, status: :forbidden
  end

  def record_not_founded(exception)
    render json: { error: exception.message }, status: :not_found
  end
end

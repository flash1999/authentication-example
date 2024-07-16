class ApplicationController < ActionController::Base
  private

  def current_user
    Rails.logger.debug("current_user called")
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user, :user_signed_in?

  def authenticate_user_from_session
    Rails.logger.debug("authenticate_user_from_session called")
    @current_user = User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    Rails.logger.debug("user_signed_in? called")
    current_user.present?
  end

  def login(user)
    Rails.logger.debug("login called with user: #{user.inspect}")
    reset_session
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    Rails.logger.debug("logout called")
    reset_session
    @current_user = nil
  end
end

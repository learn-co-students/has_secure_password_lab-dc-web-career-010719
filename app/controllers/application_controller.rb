class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, only: [:home]
  before_action :current_user

  def home
  end

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  private

  def require_login
    redirect_to login_path if !current_user
  end
end

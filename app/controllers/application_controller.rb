class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    redirect_to root_url, notice: 'You have to sign in before accessing this page' unless current_user
  end

  def is_admin?
    redirect_to root_url, notice: 'You have to sign in before accessing this page' unless current_user && current_user.is_admin?
  end
end

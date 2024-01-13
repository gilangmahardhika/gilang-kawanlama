class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    flash[:error] = "You have to sign in before accessing this page"
    redirect_to root_url, notice: '' unless current_user
  end

  def is_admin?
    flash[:error] = "You have to sign in before accessing this page"
    redirect_to root_url unless current_user && current_user.is_admin?
  end

  def logged_in?
    redirect_to products_url if current_user
  end
end

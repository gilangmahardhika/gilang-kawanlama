class UsersController < ApplicationController
  layout "dashboard"
  before_action :is_logged_in?
  before_action :is_admin?, except: [:show]

  def index
    page = !params[:page].present? ? 1 : params[:page]
    @users = User.all.page(page).per(10)
  end

  def show
  end
end

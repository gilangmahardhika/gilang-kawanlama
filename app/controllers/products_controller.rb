class ProductsController < ApplicationController
  layout "dashboard"

  before_action :is_logged_in?
  before_action :is_admin?, except: [:index, :show]

  def index
    page = !params[:page].present? ? 1 : params[:page]
    @products = Product.all.page(page).per(10)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

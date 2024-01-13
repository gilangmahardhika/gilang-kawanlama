class ProductsController < ApplicationController
  layout "dashboard"

  before_action :is_logged_in?
  before_action :is_admin?, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    page = !params[:page].present? ? 1 : params[:page]
    @products = if params[:q].present?
      Product.search_product(params[:q]).page(page).per(10)
    else
      Product.order_by_created(:desc).page(page).per(10)
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product has been created"
      redirect_to products_url, format: :html
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product has been created"
      redirect_to products_url, format: :html
    else
      render :new
    end
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:name, :sku, :count, :first_photo, :second_photo, :third_photo)
    end

    def find_product
      @product = Product.find(params[:id])
    end

end

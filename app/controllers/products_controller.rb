class ProductsController < ApplicationController
  layout "dashboard"

  before_action :is_logged_in?
end

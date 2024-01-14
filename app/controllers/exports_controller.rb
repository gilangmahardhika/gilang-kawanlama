class ExportsController < ApplicationController
  before_action :is_logged_in?
  before_action :set_export, only: [:download]

  layout "dashboard"

  def index
    page = !params[:page].present? ? 1 : params[:page]
    @exports = Export.where(user: current_user).page(page).per(10)
  end

  def create
    @export = current_user.exports.create
    if @export
      flash[:success] = "Export has been created"
      redirect_to exports_url, format: :html
    else
      flash[:error] = "Failed to export data"
      redirect_to products_url, format: :html
    end
  end

  def download
    if check_ownership?(@export.user)
      send_file @export.file_path, disposition: 'attachment', type: "text/csv", file_name: @export.file_name
    else
      flash[:error] = "You dont have permission on this"
      redirect_to exports_url, format: :html
    end
  end

  private
    def check_ownership?(export_owner)
      export_owner == current_user
    end

    def set_export
      @export = Export.find(params[:id])
    end
end

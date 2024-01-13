class AuthenticationsController < ApplicationController

  def sign_in
    @user = User.find_by(email: permitted_params[:email])
    if @user && @user.authenticate(permitted_params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You have signed in successfully"
      redirect_to products_url, format: :html
    else
      flash[:error] = "Incorrect username or password"
      redirect_to root_url, format: :html
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_url, format: :html
  end

  private
    def permitted_params
      params.require(:auth).permit(:email, :password)
    end
end

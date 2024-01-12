class AuthenticationsController < ApplicationController

  def sign_in
    @user = User.find_by(email: params[:auth][:email])
    if @user && @user.authenticate(params[:auth][:password])
      session[:user_id] = @user.id
      redirect_to products_url, notice: 'You have logged in successfully', status: :created
    else
      redirect_to root_url, notice: "Incorrect username or password", status: :unauthorized
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_url, status: 200
  end

  private
    def permitted_params
      params.require(:auth).permit(:email, :password)
    end
end

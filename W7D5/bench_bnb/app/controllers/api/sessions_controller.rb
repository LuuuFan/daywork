class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password],
    )
    if @user
      session[:session_token] = @user.session_token
      render json: @user
    else
      render plain: "Invilid Credential", status: 404
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      render {}
    else
      render status: 404
    end
  end
end

class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credential(params[:user][:username], params[:user][:password])
    if @user
      redirect_to root
    else
      flash[:errors] = 'Wrong Credential'
      render :new
    end
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:usernmae, :password)
  end
end

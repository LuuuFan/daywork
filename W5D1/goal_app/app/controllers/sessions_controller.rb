class SessionsController < ApplicationController
  before_action :require_current_user, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      session[:session_token] = user.session_token
      redirect_to user_url(user)
    else
      flash[:errors] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end
end

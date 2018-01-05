class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to cats_url
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login_user!(@user)
      redirect_to cats_url
    else
      flash[:errors] = []
      flash[:errors] << 'Wrong username/password'
      render :new
    end

  end

  def destroy
    # fail
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_sessions_url
  end


end

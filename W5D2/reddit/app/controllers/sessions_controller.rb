class SessionsController < ApplicationController
  before_action :require_current_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      session[:session_token] = @user.session_token
      # if session[:source] && session[:source]["action"] == "new"
      #   source = "/#{session[:source][:controller]}/#{session[:source][:action]}"
      #   session[:source] = nil
      #   redirect_to source
      # elsif session[:source]
      #   source = "/#{session[:source][:controller]}/#{session[:source][:id]}/#{session[:source][:action]}"
      #   session[:source] = nil
      #   redirect_to source
      # else
        redirect_to subs_url
      # end
    else
      flash.now[:errors] = ["Invalid Username or Password"]
      @user = User.new
      render :new
    end
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end

end

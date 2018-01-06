class UsersController < ApplicationController
  # before_action :require_current_user
  def new
    if current_user
      redirect_to bands_url
    else
      @user ||= User.new
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.session_token
      current_user
      redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end

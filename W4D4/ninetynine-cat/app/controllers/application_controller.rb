class ApplicationController < ActionController::Base
  before_action :require_login, only: [:destroy]
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    return nil if session[:session_token] == nil
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end

  def require_login
    # debugger
    unless logged_in?
      flash[:error] = 'You have to login to see this page'
      redirect_to new_sessions_url
    end
  end



end

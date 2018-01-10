class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    return nil if session[:session_token].nil?
    current_user = User.find_by(session_token: session[:session_token])
  end

  def require_current_user
    if current_user.nil?
      session[:source] = params
      # fail
      redirect_to new_session_url
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

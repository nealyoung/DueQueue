class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login, :except => [:users]
  
private
  def require_login
    unless current_user
      redirect_to log_in_path
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user
end

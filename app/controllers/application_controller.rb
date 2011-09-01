class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, :except => [:index, :show, :dvds]

  helper_method :current_user, :admin?

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def admin?
    ! @current_user.nil?
  end

  def require_login
    unless current_user
      redirect_to login_url, :notice => "Please login first"
    end
  end
end

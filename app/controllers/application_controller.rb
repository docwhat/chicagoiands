class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, except: [:index, :show, :dvds]

  helper_method :current_user, :admin?

  before_filter :ensure_domain

  APP_DOMAIN = 'chicagoiands.org'

  protected

  def ensure_domain
    return unless Rails.env.production?
    if request.env['HTTP_HOST'] != APP_DOMAIN
      redirect_to "http://#{APP_DOMAIN}#{request.path}", status: :moved_permanently
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def admin?
    ! @current_user.nil?
  end

  def require_login
    redirect_to login_url, notice: 'Please login first' unless current_user
  end
end

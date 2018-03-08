class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :login!, :logout!

  def current_user
    return nil unless session[:session_token].present?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def redirect_to_cats
    if logged_in?
      redirect_to cats_url
    end
  end

  def owns_cat?(cat)
    cats_array = current_user.cats.where("cats.id = #{cat.id}")

    if cats_array.empty?
      return false
    end
    true
  end

end

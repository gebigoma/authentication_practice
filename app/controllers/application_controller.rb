class ApplicationController < ActionController::Base
  # makes the below methods available in our views
  helper_method :current_user, :logged_in?

  def current_user
    # spit out current user if they've been established
    # otherwise, if there's an id in the cookie, look for that user
    # and return that instead
    #if there's no cookie, return nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to new_session_path unless logged_in?
  end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def author
    current_user === User.find(session[:id]) if session[:id]
  end

  # def current_event
  #   current_event === Event.find(session[:event_id]) if session[:event_id]
  # end

  helper_method :current_user, :author #, :current_event
end

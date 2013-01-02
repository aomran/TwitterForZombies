class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= Zombie.find(session[:zombie_id]) if session[:zombie_id]
  end
  helper_method :current_user
end

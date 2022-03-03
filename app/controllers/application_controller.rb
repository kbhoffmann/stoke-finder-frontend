class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :truffle_shuffle

  def current_user
    UserFacade.user_info(session[:user_id]) if session[:user_id]
  end

  private 
  def truffle_shuffle
    "a3c7y10lj48v"
  end
end

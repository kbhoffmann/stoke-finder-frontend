class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    UserFacade.user_info(session[:user_id]) if session[:user_id]
  end
end

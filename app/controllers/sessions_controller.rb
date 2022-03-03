class SessionsController < ApplicationController

  def new
  end

  def auth
    user_data = request.env['omniauth.auth']["info"]["email"]
    query = UserFacade.oauth_find(user_data)
    if query[:message] == "CLEAR"
      redirect_to "/register?data=#{user_data}"
    else
      user = User.new(query[:data])
      session[:user_id] = user.id
      flash[:message] = "Welcome back, #{user.user_name}"
      redirect_to '/dashboard'
    end
  end

  def create
    user_data = {user: params[:user_name], password: params[:password]}
    user = UserFacade.login_user(user_data)

    if user[:data][:id]
      user = User.new(user[:data])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.user_name}!"
      redirect_to dashboard_path
    elsif user[:status] == "ERROR"
      flash[:error] = user[:message]
      redirect_to "/login"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session.destroy
    redirect_to root_path, notice: 'Logged out'
  end
end

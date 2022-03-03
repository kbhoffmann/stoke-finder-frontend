class UsersController < ApplicationController
  def index
  end

  def show
    @user = UserFacade.user_info(session[:user_id])
  end

  def new
    @activities = RidbFacade.all_activities
    @user = params[:data]
  end

  def create
    new_user = UserFacade.user_create(create_user_params)

    if new_user[:data][:id]
      user = User.new(new_user[:data])
      session[:user_id] = user.id
      flash[:success] = "Your Profile Has Been Created!"
      redirect_to dashboard_path
    elsif new_user[:status] == "ERROR"
      flash[:error] = new_user[:message]
      redirect_to "/register"
    else
      redirect_to "/register"
    end
  end

  def edit
    @user = UserFacade.user_info(session[:user_id])
    @activities = RidbFacade.all_activities
  end

  def update
    @user = UserFacade.user_update(user_params, session[:user_id])
    if @user[:data][:id]
      flash[:success] = "Your Profile Has Been Updated!"
      redirect_to dashboard_path
    elsif @user[:status] == "ERROR"
      flash[:error] = new_user[:message]
      redirect_to "/edit"
    else
      redirect_to "/edit"
    end
  end

  def destroy
    response = UserFacade.user_delete(session[:user_id])
    session.destroy
    flash[:error] = response[:message]
    redirect_to '/'
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user == nil
      flash[:error] = "User does not exist. Please try again."
      redirect_to "/login"
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Email or password is incorrect. Please try again."
      redirect_to "/login"
    end
  end

  def login_form
  end

  def logout
    session.destroy
    redirect_to root_path
  end

private
  def create_user_params
    params["access"] = params["access"].to_i
    if params["activity_preferences"].class == Array
      params["activity_preferences"] = params["activity_preferences"].join(" ")
    end
    params.permit(:user_name, :email, :password, :password_confirmation, :access, :street_address, :city, :state, :zipcode, :activity_preferences)
  end

  def user_params
    params["id"] = session[:user_id]
    params["access"] = params["access"].to_i
    if params["activity_preferences"].class == Array
      params["activity_preferences"] = params["activity_preferences"].join(" ")
    end
    params.permit(:id, :user_name, :email, :password, :password_confirmation, :access, :street_address, :city, :state, :zipcode, :activity_preferences)
  end
end

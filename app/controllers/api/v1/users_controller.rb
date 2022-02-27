class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render(json: UserSerializer.new(User.update(params[:id], user_params)))
    else
      render :status => 404
    end
  end

private

  def user_params
    params.require(:user).permit(:id, :user_name, :email, :street_address, :city, :state, :zipcode, :activity_preferences)
  end
end

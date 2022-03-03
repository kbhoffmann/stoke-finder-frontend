class AdventuresController < ApplicationController

  def new
    @activities = params["area_activities"].map { |activity| activity[:ActivityName] }
    @user_id = session[:user_id]
    @area = RidbFacade.get_rec_area_info_by_id(params["area_activities"].first["RecAreaID"])
  end

  def create
    adventure = AdventuresFacade.adventure_create(adventure_params)
  end

  def datetime_helper(params)
    (params["datetime(3i)"] + "/" + params["datetime(2i)"] + "/" + params["datetime(1i)"] + "/" +  params["datetime(4i)"] + ":" + params["datetime(5i)"]).to_datetime
  end

  private 
  def adventure_params
    params[:date] = datetime_helper(params)
    params[:comment] = params["comments"]
    params[:user_id] = session[:user_id]
    if params["activity_preferences"].class == Array
      params[:activities] = params["activity_preferences"].join(" ")
    end
    params.permit(:guest_email_addresses, :date, :comment, :activities, :favorite, :rec_area_id, :user_id)
  end
end
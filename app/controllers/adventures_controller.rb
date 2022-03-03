class AdventuresController < ApplicationController

  def new
    @activities = params["area_activities"].map { |activity| activity[:ActivityName] }
    @user_id = session[:user_id]
    @area = RidbFacade.get_rec_area_info_by_id(params["area_activities"].first["RecAreaID"])
  end

  def create
    date = datetime_helper(params)
    # require 'pry'; binding.pry
    #set adventure ID as session or param in here
  end

  def datetime_helper(params)
    (params["datetime(3i)"] + "/" + params["datetime(2i)"] + "/" + params["datetime(1i)"] + "/" +  params["datetime(4i)"] + ":" + params["datetime(5i)"]).to_datetime
  end
end
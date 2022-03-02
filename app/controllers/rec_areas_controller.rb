class RecAreasController < ApplicationController

  def search
    @activities = RidbFacade.all_activities
  end

  def search_by_location
    #NEEDS ERROR HANDLING
    @areas = RidbFacade.search_by_location(params[:search], params["miles"])
    @location = params[:search]
  end

  def search_by_activities
    # @user = UserFacade.user_info(session[:user_id])
    @areas = RidbFacade.search_by_activities(params["activity"])
    @activities = params["activity"]
  end
end

class RecAreasController < ApplicationController

  def search
    @activities = RidbFacade.all_activities
  end

  def search_by_location
    #NEEDS ERROR HANDLING
    # binding.pry
    @areas = RidbFacade.search_by_location(params[:search], params["miles"])
    @location = params[:search]
  end
end

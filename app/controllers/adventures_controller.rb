class AdventuresController < ApplicationController
  def search
    @activities = RidbFacade.all_activities
  end
end

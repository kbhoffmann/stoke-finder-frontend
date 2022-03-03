class AdventuresController < ApplicationController

  def new
    @user_id = session[:user_id]
    # @area = some facade call
  end

  def create
    date = datetime_helper(params)
    binding.pry
  end

  def datetime_helper(params)
    (params["datetime(3i)"] + "/" + params["datetime(2i)"] + "/" + params["datetime(1i)"] + "/" +  params["datetime(4i)"] + ":" + params["datetime(5i)"]).to_datetime
  end
end
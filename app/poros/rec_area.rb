class RecArea
  attr_reader :id,
              :name,
              :fee,
              :description,
              :directions,
              :latitude,
              :longitude,
              :reservable,
              :activities
              
  def initialize(data)
    @id = data[:RecAreaID]
    @name = data[:RecAreaName]
    @fee = data[:RecAreaFeeDescription]
    @description = data[:RecAreaDescription]
    @directions = data[:RecAreaDirections]
    @latitude = data[:RecAreaLatitude]
    @longitude = data[:RecAreaLongitude]
    @email = data[:RecAreaEmail]
    @phone = data[:RecAreaPhone]
    @reservable = data[:Reservable]
    @activities = data[:ACTIVITY]
  end

  def phone
    if @phone == ""
      "Information Not Available"
    else
      @phone
    end
  end

  def email
    if @email == ""
      "Information Not Available"
    else
      @email
    end
  end

  def fee
    if @fee == ""
      "Information Not Available"
    else
      @fee
    end
  end
end

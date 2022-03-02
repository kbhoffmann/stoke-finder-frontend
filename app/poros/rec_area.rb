class RecArea
  attr_reader :id,
              :name,
              :fee_description,
              :description,
              :directions,
              :latitude,
              :longitude,
              :email,
              :phone,
              :reservable,
              :activities
  def initialize(data)
    @id = data[:RecAreaID]
    @name = data[:RecAreaName]
    @fee_description = data[:RecAreaFeeDescription]
    @description = data[:RecAreaDescription]
    @directions = data[:RecAreaDirections]
    @latitude = data[:RecAreaLatitude]
    @longitude = data[:RecAreaLongitude]
    @email = data[:RecAreaEmail]
    @phone = data[:RecAreaPhone]
    @reservable = data[:Reservable]
    @activities = data[:ACTIVITY]
  end
end

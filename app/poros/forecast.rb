class Forecast
  attr_reader :overview,
              :description,
              :temp,
              :icon_number

  def initialize(weather_data)
    @temp = weather_data[:temp]
    @description = weather_data[:weather][0][:description]
    @overview = weather_data[:weather][0][:main]
    @icon_number = weather_data[:weather][0][:icon]
  end
end

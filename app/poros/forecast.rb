class Forecast
  attr_reader :overview,
              :description,
              :temp,
              :icon_number,
              :feels_like_temp,
              :humidity,
              :wind_speed_mph,
              :uv_index

  def initialize(weather_data)
    @temp = weather_data[:temp]
    @feels_like_temp = weather_data[:feels_like]
    @description = weather_data[:weather][0][:description]
    @overview = weather_data[:weather][0][:main]
    @icon_number = weather_data[:weather][0][:icon]
    @humidity = weather_data[:humidity]
    @wind_speed_mph = weather_data[:wind_speed]
    @uv_index= weather_data[:uvi]
  end
end

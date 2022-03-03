class WeatherService

  def self.get_url(url)
    Faraday.new(url)
  end

  def self.conn
    get_url(url: 'https://api.openweathermap.org')
  end

  def self.get_weather(latitude, longitude)
    response = conn.get("/data/2.5/onecall?") do |request|
      request.params['lat'] = latitude
      request.params['lon'] = longitude
      request.params['appid'] = "#{ENV['weather_api_key']}"
      request.params['units'] = "imperial"
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end
end

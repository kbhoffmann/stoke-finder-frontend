class RidbService

  def self.get_url(url)
    Faraday.new(url)
  end

  def self.conn
    get_url(url: 'https://ridb.recreation.gov',
    headers: {'apiKey' => ENV['api_key']})
  end

  def self.get_activities
    response = conn.get("/api/v1/activities?limit=128&offset=0")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_rec_area(latitude, longitude, radius = 50.00, activities)
  response = conn.get("/api/v1/recareas?") do |request|
    request.params['limit'] = "10"
    request.params['latitude'] = latitude
    request.params['longitude'] = longitude
    request.params['radius'] = radius
    request.params['full'] = true
    request.params['activity'] = activities
    end
    data = JSON.parse(response.body, symbolize_names: true)
  end
end

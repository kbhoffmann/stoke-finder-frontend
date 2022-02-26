class RidbService

  def self.get_url(url)
    Faraday.new(url)
  end

  def self.conn
    get_url(url: 'https://ridb.recreation.gov',
    headers: {'apiKey' => '994ee799-c63c-48f6-8ddb-a988d4485140'})
  end

  def self.get_activities
    response = conn.get("/api/v1/activities?limit=128&offset=0")
    JSON.parse(response.body, symbolize_names: true)
  end
end
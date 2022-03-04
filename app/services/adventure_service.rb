class AdventureService 
  def self.conn
    Faraday.new("https://arcane-sands-07034.herokuapp.com")
  end

  def self.adventure_create(attributes)
    require 'pry'; binding.pry
    response = conn.post("/api/v1/adventures", attributes.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, symbolize_names: true)
  end
end
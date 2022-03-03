class AdventuresService 
  def self.conn
    Faraday.new("https://arcane-sands-07034.herokuapp.com")
  end

  def self.adventure_create(attributes)
    response = conn.post("/api/v1/adventures", attributes.to_json, "CONTENT_TYPE" => "application/json")
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
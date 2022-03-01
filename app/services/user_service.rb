class UserService
  def self.all_users
    response = conn.get("/api/v1/users")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_info(user_id)
    response = conn.get("/api/v1/users/#{user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_create(attributes)
    response = conn.post("/api/v1/users", attributes.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_update(attributes)
    response = conn.patch("/api/v1/users", attributes.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, symbolize_names: true)
  end
  # def self.user_adventures(user_id)
  #   response = conn.get("/api/v1/users/#{user_id}/adventures")
  #   JSON.parse(response.body, symbolize_names: true)
  # end


  def self.conn
    Faraday.new("https://arcane-sands-07034.herokuapp.com")
  end
end

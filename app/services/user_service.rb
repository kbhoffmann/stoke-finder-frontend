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
    request = conn.post("/api/v1/users/create", attributes.to_json)
    binding.pry

  end

  # def self.user_adventures(user_id)
  #   response = conn.get("/api/v1/users/#{user_id}/adventures")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.conn
    Faraday.new("https://arcane-sands-07034.herokuapp.com")
  end
end
